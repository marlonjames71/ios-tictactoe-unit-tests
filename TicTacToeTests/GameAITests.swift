//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Marlon Raskin on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {

	// Game Logic
	// * Win Conditions
	//		* x wins
	//		* o wins
	//		* cats game
	//		* row in a direction is filled (horizontal, vertaical, diagonal)
	// * Game Player

	func testThereIsNoWinnerWithNewGame() {
		var board = GameBoard()

		XCTAssertFalse(game(board: board, isWonBy: .x))
		XCTAssertFalse(game(board: board, isWonBy: .o))
	}

	// TDD = Test Driven Development
	// Red, Green, Refactor
	// 1. Red = Write a failing test (compilation errors are failures)
	// 2. Green = Make the test pass (Implement method / logic so test passes)
	// 3. Refactor = Clean up code (Rename, rearange, and more helper functions, etc.)

	/*

	// (x, y)
	// (0, 0), (1, 0), (2, 0)
	// (0, 1), (1, 1), (2, 1)
	// (0, 2), (1, 2), (2, 2)

	x 0
	x 0
	x -
	
	*/

	// Vertical Check
	func testXWinsCheckingVertical1() throws {
		var board = GameBoard()
		try board.place(mark: .x, on: (0, 0))
		try board.place(mark: .o, on: (1, 0))
		try board.place(mark: .x, on: (0, 1))
		try board.place(mark: .o, on: (1, 1))
		try board.place(mark: .x, on: (0, 2))

		XCTAssertTrue(game(board: board, isWonBy: .x))
	}

	func testOWinsCheckingVertical1() throws {
		var board = GameBoard()
		try board.place(mark: .o, on: (0, 0))
		try board.place(mark: .x, on: (1, 0))
		try board.place(mark: .o, on: (0, 1))
		try board.place(mark: .x, on: (1, 1))
		try board.place(mark: .o, on: (0, 2))

		XCTAssertTrue(game(board: board, isWonBy: .o))
	}

	func testXWinsCheckingVertical2() throws {
		var board = GameBoard()
		try board.place(mark: .x, on: (1, 0))
		try board.place(mark: .o, on: (2, 0))
		try board.place(mark: .x, on: (1, 1))
		try board.place(mark: .o, on: (2, 1))
		try board.place(mark: .x, on: (1, 2))

		XCTAssertTrue(game(board: board, isWonBy: .x))
	}

	func testXWinsCheckingVertical3() throws {
		var board = GameBoard()
		try board.place(mark: .x, on: (2, 0))
		try board.place(mark: .o, on: (1, 0))
		try board.place(mark: .x, on: (2, 1))
		try board.place(mark: .o, on: (1, 1))
		try board.place(mark: .x, on: (2, 2))

		XCTAssertTrue(game(board: board, isWonBy: .x))
	}

	// Horizontal Check
	func testXWinsCheckingHorizontal1() throws {
		var board = GameBoard()
		try board.place(mark: .x, on: (0, 0))
		try board.place(mark: .o, on: (0, 1))
		try board.place(mark: .x, on: (1, 0))
		try board.place(mark: .o, on: (1, 1))
		try board.place(mark: .x, on: (2, 0))

		XCTAssertTrue(game(board: board, isWonBy: .x))
	}

	func testOWinsCheckingHorizontal1() throws {
		var board = GameBoard()
		try board.place(mark: .x, on: (0, 0))
		try board.place(mark: .o, on: (0, 1))
		try board.place(mark: .x, on: (1, 0))
		try board.place(mark: .o, on: (1, 1))
		try board.place(mark: .x, on: (1, 2))
		try board.place(mark: .o, on: (2, 1))

		XCTAssertTrue(game(board: board, isWonBy: .o))
	}

	// Diaginal Check
	func testXWinsDiagonalTopLeftToBottomRight() throws {
		var board = GameBoard()
		try board.place(mark: .x, on: (0, 0))
		try board.place(mark: .o, on: (1, 0))
		try board.place(mark: .x, on: (1, 1))
		try board.place(mark: .o, on: (0, 2))
		try board.place(mark: .x, on: (2, 2))

		XCTAssertTrue(game(board: board, isWonBy: .x))
	}

	func testXWinsDiagonalBottomLeftToTopRight() throws {
		var board = GameBoard()
		try board.place(mark: .x, on: (0, 2))
		try board.place(mark: .o, on: (0, 0))
		try board.place(mark: .x, on: (1, 1))
		try board.place(mark: .o, on: (0, 1))
		try board.place(mark: .x, on: (2, 0))

		XCTAssertTrue(game(board: board, isWonBy: .x))
	}

	
	func testXNotWinsConditionVertical1And2() throws {
		var board = GameBoard()
		try board.place(mark: .x, on: (2, 0))
		try board.place(mark: .x, on: (2, 1))
		try board.place(mark: .x, on: (2, 2))

		XCTAssertTrue(game(board: board, isWonBy: .x))
	}


}
