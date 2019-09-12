//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func checkWin(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {

	// How do we know if x won in vertical direction?
	return verticalWinCondition(board: board, player: player) ||
		horizontalWinCondition(board: board, player: player) ||
		diagonalWinCondition(board: board, player: player)
}


func verticalWinCondition(board: GameBoard, player: GameBoard.Mark) -> Bool {
	for x in 0 ..< 3 {
		var count = 0
		for y in 0 ..< 3 {
			if board[(x, y)] == player {
				count += 1
			}
		}

		if count == 3 {
			return true
		}
	}

	return false
}

func horizontalWinCondition(board: GameBoard, player: GameBoard.Mark) -> Bool {
	for y in 0 ..< 3 {
		var count = 0
		for x in 0 ..< 3 {
			if board[(x, y)] == player {
				count += 1
			}
		}

		if count == 3 {
			return true
		}
	}
	return false
}

func diagonalWinCondition(board: GameBoard, player: GameBoard.Mark) -> Bool {
	let middlePosition = board[(1, 1)]

	if middlePosition == player {
		if board[(0, 0)] == player && board[(2, 2)] == player {
			return true
		} else if board[(0, 2)] == player && board[(2, 0)] == player {
			return true
		}
	}

	return false
}
