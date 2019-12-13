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
    
    func testTableViewCreateThread() {
        let textField = app.textFields["MessageThreadTableViewController.TextField"]
        XCTAssert(textField.exists)
        textField.tap()
        textField.typeText("Test")
        app.keyboards.buttons["Return"].tap()
        
        let tableRow = app.tables.staticTexts["Test"]
        XCTAssertTrue(tableRow.exists)
    }
    
    func testDecodingMessages() {
        let tableRow = app.tables.staticTexts["A New Thread"]
        XCTAssertTrue(tableRow.exists)
    }
    
    func testCreateNewMessage() {
        
        let messageThreadtextField = app.textFields["MessageThreadTableViewController.TextField"]
        XCTAssert(messageThreadtextField.exists)
        messageThreadtextField.tap()
        messageThreadtextField.typeText("Test")
        app.keyboards.buttons["Return"].tap()
        
        let tableRow = app.tables.staticTexts["Test"]
        XCTAssertTrue(tableRow.exists)
        
        tableRow.tap()
        XCTAssert(app.navigationBars["Test"].exists)
        
        app.navigationBars["Test"].buttons["Add"].tap()
        
        XCTAssert(app.navigationBars["New Message"].exists)
        
        let messageDetailTextField = app.textFields["MessageDetailViewController.TextField"]
        XCTAssert(messageDetailTextField.exists)

        let messageDetailTextView = app.textViews["MessageDetailViewController.TextView"]
        XCTAssert(messageDetailTextView.exists)
        
        let sendButton = app.navigationBars["New Message"].buttons["Send"]
        XCTAssert(sendButton.exists)
        
        sendButton.tap()
        XCTAssert(app.navigationBars["Test"].exists)
    }
    
}
