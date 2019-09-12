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

	func testResetGameBoard() {
		var gameControl = GameControl()
		XCTAssertNil(gameControl.gameIsOver == false)
	}




}
