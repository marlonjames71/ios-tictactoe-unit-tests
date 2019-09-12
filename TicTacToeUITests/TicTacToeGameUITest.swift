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

		continueAfterFailure = false
		app = XCUIApplication()
		app.launchArguments = ["UITesting"]
		app.launch()


	}

	/*
	func testSavingAndRestartingApp() {
		// Test saving .. terminate and verify on relaunch it saved the data
		app.terminate()

		// TODO: Test the last edited item is in the tableView
	}
	*/

	// 1. Move the focus inside the { }
	// 2. Click on the record button
	/*
	func testRecording() {
		// Place cursor here

		let app = XCUIApplication()
		let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element
		element.tap()

		let element2 = element.children(matching: .other).element
		let element3 = element2.children(matching: .other).element(boundBy: 0)
		let button = element3.children(matching: .button).matching(identifier: " ").element(boundBy: 0)
		button.tap()
		button.tap()
		element2.children(matching: .other).element(boundBy: 1).children(matching: .button).matching(identifier: " ").element(boundBy: 1).tap()
		element3.buttons[" "].tap()
		element2.children(matching: .other).element(boundBy: 2).children(matching: .button).matching(identifier: " ").element(boundBy: 2).tap()
		app.buttons["Restart"].tap()

	}
*/

	// DRY - Don't Repeat Yourself
	// ..Therefore, create helper functions

	var statusLabel: XCUIElement {
		let label = app.staticTexts["GameViewController.statusLabel"] // Might be GameController.statusLabel
		XCTAssertTrue(label.exists)
		return label
	}

	var restartbutton: XCUIElement {
		let button = app.buttons["Restart"]
		XCTAssertTrue(button.exists)
		XCTAssertTrue(button.isEnabled)
		return button
	}


	func buttonAt(_ index: Int) -> XCUIElement {
		let buttonID = "BoardViewController.button\(index)"
		let button = app.buttons[buttonID]
		XCTAssertTrue(button.exists)
		return button
	}


	enum Mark: String, Equatable {
		case x = "X"
		case o = "O"
		case empty = " "

		var stringValue: String {
			switch self {
			case .x: return "X"
			case .o: return "O"
			case .empty: return " "
			}
		}
	}


//	func testGameBoardIsClearOnScratch() {
//		// TEST: status Label
//		// TEST: Restart button
//		// TEST: All buttons are blank
//
//		XCTAssertEqual("Player X's Turn", statusLabel.label)
//		XCTAssertEqual("Restart", restartbutton.label)
//
//		let button = app.buttons["BoardViewController.button0"]
//		button.tap()
//		print(button.title) // TODO: BLANK, why?
//		print(button.label) // USE label for buttons
//
//		let button0 = buttonAt(0)
//		XCTAssertEqual(Mark.empty.rawValue, button0.label)
//		button0.tap()
//		XCTAssertEqual("X", button0.label)
//	}


	func testGameBoardIsClearOnStart() {
		XCTAssertEqual("Player X's Turn", statusLabel.label)
		XCTAssertEqual("Restart", restartbutton.label)

		for index in 0..<9 {
			XCTAssertEqual(Mark.empty.rawValue, buttonAt(index).label)
		}
	}

	func testGameBoardResetClearsBoard() {

		for index in 0..<9 {
			let button = buttonAt(index)
			button.tap()
		}

		restartbutton.tap()

		for index in 0..<9 {
			XCTAssertEqual(Mark.empty.rawValue, buttonAt(index).label)
		}
		XCTAssertEqual("Player X's turn", statusLabel.label)
	}

	func testPlayerXVerticalWin1() {
		buttonAt(0).tap()
		buttonAt(1).tap()
		buttonAt(3).tap()
		buttonAt(4).tap()
		buttonAt(6).tap()

		// Player X Has Won
		XCTAssertEqual("Player X won!", statusLabel.label)

	}
}

