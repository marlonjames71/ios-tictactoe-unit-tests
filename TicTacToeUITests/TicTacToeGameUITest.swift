//
//  TicTacToeGameUITest.swift
//  TicTacToeUITests
//
//  Created by Marlon Raskin on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

class TicTacToeGameUITest: XCTestCase {

	var app: XCUIApplication!


	override func setUp() {
		super.setUp()
		print("Starting a new UI test")
		app = XCUIApplication()
		app.launch()


	}


	func testSavingAndRestartingApp() {
		// Test saving .. terminate and verify on relaunch it saved the data
		app.terminate()

		// TODO: Test the last edited item is in the tableView
	}





}

