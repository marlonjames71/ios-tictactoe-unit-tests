//
//  Game.swift
//  TicTacToe
//
//  Created by Marlon Raskin on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum GameBoardError: Error, Equatable {
	case invalidSquare
}

struct GameControl {

	var moves: [Coordinate] = []

	mutating func restart() {
		board = GameBoard()
		activePlayer = .x
		winningPlayer = nil
		gameIsOver = false
	}

	mutating func makeMark(at coordinate: Coordinate) throws {
		guard let activePlayer = activePlayer else { return }
		try board.place(mark: activePlayer, on: coordinate)
		moves.append(coordinate)
	}

	mutating func unmark() throws {
		guard let lastMove = moves.last else { return }
		try board.remove(on: lastMove)
		moves.removeLast()
		if activePlayer == GameBoard.Mark.x {
			activePlayer = GameBoard.Mark.o
		} else if activePlayer == GameBoard.Mark.o {
			activePlayer = GameBoard.Mark.x
		}
	}


	private(set) var board = GameBoard()


	var activePlayer: GameBoard.Mark? = .x
	var gameIsOver: Bool = false
	var winningPlayer: GameBoard.Mark?
}
