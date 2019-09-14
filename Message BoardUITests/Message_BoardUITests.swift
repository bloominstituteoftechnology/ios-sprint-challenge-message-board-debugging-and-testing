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
	
	var usernameTextField: XCUIElement {
		let textField = app.textFields.element
		XCTAssertTrue(textField.exists)
		return textField
	}
	
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
	
	func loginProcedure() {
		let loginBtn = app.buttons["Login"]
		usernameTextField.tap()
		usernameTextField.typeText("TestUser")
		app.tap()
		loginBtn.tap()
	}
	
	func testvalidUsernameOpensToThreads() {
		let loginBtn = app.buttons["Login"]
		
		usernameTextField.typeText("Hi")
		app.tap()
		loginBtn.tap()
		XCTAssertTrue(loginBtn.exists)
		
		loginProcedure()
		XCTAssertFalse(loginBtn.exists)
	}
	
	func testThreadCellOpensThread() {
		loginProcedure()
		let cell = threadTableView.cells.firstMatch
		
		XCTAssertTrue(cell.exists)
		XCTAssertEqual("A New Thread", cell.staticTexts.element.label)
		cell.tap()
		XCTAssertFalse(cell.isHittable)
	}
	
	func testMessageCellOpensMessage() {
		loginProcedure()
		let cell = threadTableView.cells.firstMatch
		cell.tap()
		
		let messageCell = messageTableView.cells.firstMatch
		
		XCTAssertTrue(messageCell.exists)
		
		let addBtn = app.navigationBars.buttons["Add"]
		addBtn.tap()
		XCTAssertFalse(messageCell.exists)
	}
	
	func testNewMessageCreated() {
		loginProcedure()
		let cell = threadTableView.cells.firstMatch
		cell.tap()
		
		let addBtn = app.navigationBars.buttons["Add"]
		addBtn.tap()
		
		let username = usernameTextField.value as! String
		XCTAssertFalse(username.isEmpty)
		
		let message = "This is a test"
		let textView = app.textViews.element
		
		textView.tap()
		textView.typeText(message)
		app.tap()
		
		XCTAssertEqual(message, textView.value as? String)
		
		let sendBtn = app.navigationBars.buttons["Send"]
		XCTAssertTrue(sendBtn.exists)
		sendBtn.tap()
		
		XCTAssertTrue(addBtn.isHittable)
	}
}
