//
//  GameControlTests.swift
//  TicTacToeTests
//
//  Created by Marlon Raskin on 9/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest
@testable import TicTacToe


class GameControlTests: XCTestCase {

	func testRestartGameIsOverSetToFalse() {
		var gameControl = GameControl()
		gameControl.restart()
		XCTAssertFalse(gameControl.gameIsOver)
	}

	func testRestartWinningPlayerSetToX() {
		var gameControl = GameControl()
		gameControl.restart()
		XCTAssertNil(gameControl.winningPlayer)
	}

	func testRestartActivePlayerSetToX() {
		var gameControl = GameControl()
		gameControl.restart()
		XCTAssertTrue(gameControl.activePlayer == Mark.x)
	}

}
