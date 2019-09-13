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
    
    var messageBoardTableView: XCUIElement {
        let tableView = app.tables.firstMatch
        XCTAssertTrue(tableView.exists)
        return tableView
    }
    
    var addButton: XCUIElement {
        let button = app.buttons["MessageThreadDetailTableViewController.addButton"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    var nameTextField: XCUIElement {
        let textField = app.textFields["MessageDetailViewController.nameTextField"]
        XCTAssertTrue(textField.exists)
        return textField
    }
    
    var messageTextView: XCUIElement {
        let textView = app.textViews["MessageDetailViewController.messageTextView"]
        XCTAssertTrue(textView.exists)
        return textView
    }
    
    var messageTableView: XCUIElement {
        let tableView = app.tables["MessageThreadDetailTableViewController.tableView"]
        XCTAssertTrue(tableView.exists)
        return tableView
    }
    
    var sendButton: XCUIElement {
        let button = app.buttons["MessageDetailViewController.sendButton"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    func testTitleCorrectlyDisplay() {
        XCTAssertTrue(app.navigationBars["λ Message Board"].exists)
        XCTAssertTrue(app.navigationBars["λ Message Board"].isHittable)
    }
    
    func testTapOnCell1GoFromMessageBoardToThreadDetail() {
        let cell1 = messageBoardTableView.cells.firstMatch
        let title = cell1.staticTexts.firstMatch.label
        cell1.tap()
        XCTAssertTrue(app.navigationBars[title].exists)
        XCTAssertTrue(app.navigationBars[title].isHittable)
    }
    
    func testTapOnPlusGoFromThreadDetailToAddMessage() {
        let cell1 = messageBoardTableView.cells.firstMatch
        let title = cell1.staticTexts.firstMatch.label
        cell1.tap()
        XCTAssertTrue(app.navigationBars[title].exists)
        XCTAssertTrue(app.navigationBars[title].isHittable)
        
        addButton.tap()
        
        XCTAssertTrue(app.navigationBars["New Message"].exists)
        XCTAssertTrue(app.navigationBars["New Message"].isHittable)
        
        XCTAssertEqual("", nameTextField.label)
        XCTAssertEqual("", messageTextView.label)
    }
    
    
    func testSendingNewMessage() {
        let cell1 = messageBoardTableView.cells.firstMatch
        let title = cell1.staticTexts.firstMatch.label
        cell1.tap()
        XCTAssertTrue(app.navigationBars[title].exists)
        XCTAssertTrue(app.navigationBars[title].isHittable)
        
        addButton.tap()
        
        XCTAssertTrue(app.navigationBars["New Message"].exists)
        XCTAssertTrue(app.navigationBars["New Message"].isHittable)
        
        XCTAssertEqual("", nameTextField.label)
        XCTAssertEqual("", messageTextView.label)
        nameTextField.tap()
        nameTextField.typeText("bradley")
        messageTextView.tap()
        messageTextView.typeText("this is UI testing message")
        sendButton.tap()
        
        XCTAssertTrue(app.navigationBars[title].exists)
        XCTAssertTrue(app.navigationBars[title].isHittable)
        
       XCTAssertTrue(messageTableView.cells.staticTexts["bradley"].exists)
        
        
        
        
    }
    
}
