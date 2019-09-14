//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
	
	var threadTableView: XCUIElement {
		let tableView = app.tables["MessageThreadsTableViewController.tableView"]
		XCTAssertTrue(tableView.exists)
		return tableView
	}
	
	var messageTableView: XCUIElement {
		let tableView = app.tables["MessageThreadDetailTableViewController.tableView"]
		XCTAssertTrue(tableView.exists)
		return tableView
	}
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
	
	func testThreadCellOpensThread() {
		let cell = threadTableView.cells.firstMatch
		
		XCTAssertTrue(cell.exists)
		XCTAssertEqual("A New Thread", cell.staticTexts.element.label)
		cell.tap()
		XCTAssertFalse(cell.exists)
	}
	
	func testMessageCellOpensMessage() {
		let cell = threadTableView.cells.firstMatch
		cell.tap()
		
		let messageCell = messageTableView.cells.firstMatch
		
		XCTAssertTrue(messageCell.exists)
		XCTAssertEqual("Checking to make sure this works.", messageCell.staticTexts.firstMatch.label)
		
		let addBtn = app.navigationBars.buttons["Add"]
		addBtn.tap()
		XCTAssertFalse(messageCell.exists)
	}
	
	func testNewMessageCreated() {
		let cell = threadTableView.cells.firstMatch
		cell.tap()
		
		let addBtn = app.navigationBars.buttons["Add"]
		addBtn.tap()
		
		let sender = "Testing test"
		let message = "This is a test"
		let textField = app.textFields.element
		let textView = app.textViews.element
		
		textField.tap()
		textField.typeText(sender)
		textView.tap()
		textView.typeText(message)
		
		XCTAssertEqual(sender, textField.value as? String)
		XCTAssertEqual(message, textView.value as? String)
		
		let sendBtn = app.navigationBars.buttons["Send"]
		XCTAssertTrue(sendBtn.exists)
		sendBtn.tap()
		
		XCTAssertTrue(addBtn.isHittable)
	}
}
