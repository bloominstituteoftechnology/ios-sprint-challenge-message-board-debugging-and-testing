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
	let titleOne = "Testing again"
	let titleTwo = "A New Thread"
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

	var threadTableView: XCUIElement {
		let table = app.tables["MessageThreadTableViewController.tableView"]
		XCTAssertTrue(table.exists)
		return table
	}

	var messageTableView: XCUIElement {
		let table = app.tables["MessageThreadDetailTableViewController.tableView"]
		XCTAssertTrue(table.exists)
		return table
	}

	var cell: XCUIElement {
		let tableCell = threadTableView.cells.firstMatch
		XCTAssertTrue(tableCell.exists)
		return tableCell
	}

	func testTappingOnCellSeguesToMessageTableView() {
		XCTAssertTrue(cell.isHittable)
		cell.tap()
	}

	func testCanTapTableViewCell() {
		cell.tap()
		let addButton = app.navigationBars.buttons["Add"]
		XCTAssertTrue(addButton.exists)
		XCTAssertTrue(addButton.isEnabled)
		addButton.tap()
	}

	func testSendButtonPopsViewController() {
		cell.tap()
		let addButton = app.navigationBars.buttons["Add"]
		addButton.tap()
		app.textFields.element.tap()
		app.textFields.element.typeText("I'm not really typing this!")
		app.navigationBars.buttons["Send"].tap()
		XCTAssertTrue(addButton.exists)
	}

	func testTextFieldCreatesNewThreadByTappingEnter() {
		XCTAssertTrue(threadTableView.cells.count == 2)
		app.textFields.element.tap()
		app.textFields.element.typeText("This is not me, I swear!")
		app.buttons["return"].tap()
		XCTAssertTrue(threadTableView.cells.count == 3)
	}
}
