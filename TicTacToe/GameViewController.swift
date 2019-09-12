//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

	private var boardViewController: BoardViewController! {
		willSet {
			boardViewController?.delegate = nil
		}
		didSet {
			boardViewController?.board = gameControl.board
			boardViewController?.delegate = self
		}
	}

	var gameControl = GameControl()

	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var undoButton: UIButton!

	private var gameState = GameState.active(.x) {
		didSet {
			updateViews()
		}
	}

//	private var board = GameBoard() {
//		didSet {
//			boardViewController.board = board
//		}
//	}


    private enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }

    @IBAction func restartGame(_ sender: Any) {
		gameControl.restart()
		boardViewController.board = gameControl.board
        gameState = .active(.x)
		//        board = GameBoard()
    }

	@IBAction func undoTapped(_ sender: UIButton) {
		try? gameControl.unmark()
	}

    // MARK: - Private

    private func updateViews() {
        guard isViewLoaded else { return }

        switch gameState {
        case let .active(player):
            statusLabel.text = "Player \(player.stringValue)'s turn"
        case .cat:
            statusLabel.text = "Cat's game!"
        case let .won(player):
            statusLabel.text = "Player \(player.stringValue) won!"
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
			boardViewController = segue.destination as? BoardViewController
        }
    }
}


extension GameViewController: BoardViewControllerDelegate {
	func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
		guard case let GameState.active(player) = gameState else {
			NSLog("Game is over")
			return
		}

		do {
			try gameControl.makeMark(at: coordinate)
			if checkWin(board: gameControl.board, isWonBy: player) {
				gameState = .won(player)
			} else if gameControl.board.isFull {
				gameState = .cat
			} else {
				let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
				gameState = .active(newPlayer)
				gameControl.activePlayer = newPlayer
			}
		} catch {
			NSLog("Illegal move")
		}
	}
}
