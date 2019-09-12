//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Marlon Raskin on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
	// Unit tests always start with "test"
	func testGameBoard() {
		// XCTFail("The game board doesn't work properly")

		// A compilation error is a unit test failure
		let board = GameBoard()
//		board[(0, 0)] // Top left corner

		XCTAssertNil(board[(0, 0)])

		// (x, y)
		// (0, 0), (1, 0), (2, 0)
		// (0, 1), (1, 1), (2, 1)
		// (0, 2), (1, 2), (2, 2)

		for x in 0 ..< 3 {
			for y in 0 ..< 3 {
				XCTAssertNil(board[(x, y)])
			}
		}
	}

	// test<What we are testing><What we expect>()zz
	func testNewBoardIsEmpty() {

	}

	//
	func testPlacingXMarkInTopLeftCorner() throws {
		let board = GameBoard()

		try board.place(mark: .x, on: (0, 0))

		// AssertedEqual(expected, actual)
		XCTAssertEqual(.x, board[(0, 0)])
	}

	func testPlacingDuplicateMarkThrowsError() throws {
		let board = GameBoard()
		try board.place(mark: .x, on: (0, 0))
		XCTAssertThrowsError(try board.place(mark: .o, on: (0, 0)))
	}







}

