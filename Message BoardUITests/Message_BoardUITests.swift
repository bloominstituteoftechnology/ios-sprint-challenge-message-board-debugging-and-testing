//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {

	var app: XCUIApplication!

	override func setUp() {
		super.setUp()

		continueAfterFailure = false
		app = XCUIApplication()

		// NOTE: Keep this setup as is for UI Testing
		app.launchArguments = ["UITesting"]
		app.launch()
	}


	func testCreateThread() {
		let newThreadBar = app.tables["Empty list"].textFields["Create a new thread:"]
		newThreadBar.tap()
		newThreadBar.typeText("Test #1")
		let enterButton = app.keyboards.buttons["Return"]
		enterButton.tap()
		XCTAssert(app.tables.cells.staticTexts["Test #1"].exists)
	}

	func testTapThread() {
		let newThreadBar = app.tables["Empty list"].textFields["Create a new thread:"]
		newThreadBar.tap()
		newThreadBar.typeText("Test #2")
		let enterButton = app.keyboards.buttons["Return"]
		enterButton.tap()
		let selectedCell = app.tables.cells.staticTexts["Test #2"]
		selectedCell.tap()
		XCTAssert(app.navigationBars["Test #2"].exists)
	}

	func testCreateMessage() {
		let newThreadBar = app.tables["Empty list"].textFields["Create a new thread:"]
		newThreadBar.tap()
		newThreadBar.typeText("Test #3")
		let enterButton = app.keyboards.buttons["Return"]
		enterButton.tap()
		let selectedCell = app.tables.cells.staticTexts["Test #3"]
		selectedCell.tap()
		let addButton = app.buttons["Add"]
		addButton.tap()
		let nameField = app.textFields["Enter your name:"]
		nameField.tap()
		nameField.typeText("Message Test #1")
		let messageTextView = app.textViews.element(boundBy: 0)
		messageTextView.tap()
		messageTextView.typeText("Testing")
		let saveButton = app.buttons["Send"]
		saveButton.tap()
		XCTAssert(app.tables.cells.staticTexts["Test #3"].exists)
	}

	func testTapMessage() {
		let newThreadBar = app.tables["Empty list"].textFields["Create a new thread:"]
		newThreadBar.tap()
		newThreadBar.typeText("Test #4")
		let enterButton = app.keyboards.buttons["Return"]
		enterButton.tap()
		let selectedCell = app.tables.cells.staticTexts["Test #4"]
		selectedCell.tap()
		let addButton = app.buttons["Add"]
		addButton.tap()
		let nameField = app.textFields["Enter your name:"]
		nameField.tap()
		nameField.typeText("Message Test #2")
		let messageTextView = app.textViews.element(boundBy: 0)
		messageTextView.tap()
		messageTextView.typeText("Testing")
		let saveButton = app.buttons["Send"]
		saveButton.tap()
		let messageCell = app.tables.cells.staticTexts["Test #4"]
		messageCell.tap()
		XCTAssert(app.navigationBars["Test #4"].exists)
		XCTAssert(app.staticTexts["Message Test #2"].exists)
		XCTAssert(app.staticTexts["Testing"].exists)
	}

}
