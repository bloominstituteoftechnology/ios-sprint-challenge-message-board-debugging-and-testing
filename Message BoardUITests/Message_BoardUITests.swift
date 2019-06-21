//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testCreateThread() {
        let app = XCUIApplication()
        let textField = app.tables.textFields["ThreadTextField"]
        textField.tap()
        textField.typeText("New Thread")
        XCTAssert(textField.exists)
        app.buttons["return"].tap()
        let cell = app.tables.staticTexts["New Thread"]
        XCTAssert(cell.exists)
        XCTAssertTrue(cell.label == "New Thread")
        XCTAssertFalse(cell.label == "A New Thread")
    }

    func testMessageThreadDetailTitle() {
        let app = XCUIApplication()
        let cell = app.tables.staticTexts["A New Thread"]
        XCTAssert(cell.exists)
        cell.tap()
        XCTAssert(app.navigationBars["A New Thread"].exists)
        XCTAssertFalse(app.navigationBars["λ Message Board"].exists)
    }

    func testAddMessage() {
        let app = XCUIApplication()
        let cell = app.tables.staticTexts["A New Thread"]
        XCTAssert(cell.exists)
        cell.tap()
        let addButton = app.navigationBars["A New Thread"].buttons["Add"]
        XCTAssert(addButton.exists)
        addButton.tap()

        let textField = app.textFields["Enter your name:"]
        XCTAssert(textField.exists)
        textField.tap()
        textField.typeText("Test Name")

        let textView = app.textViews["MessageTextView"]
        XCTAssert(textView.exists)
        textView.tap()
        textView.typeText("This is a test message.")

        let sendButton = app.navigationBars["New Message"].buttons["Send"]
        XCTAssert(sendButton.exists)
        sendButton.tap()

        let messageCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["This is a test message."]/*[[".cells.staticTexts[\"This is a test message.\"]",".staticTexts[\"This is a test message.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(messageCell.exists)
        XCTAssertTrue(messageCell.label == "This is a test message.")
    }

    func testSwitchThreads() {
        let app = XCUIApplication()
        let cell = app.tables.staticTexts["A New Thread"]
        XCTAssert(cell.exists)
        cell.tap()
        let addButton = app.navigationBars["A New Thread"].buttons["Add"]
        XCTAssert(addButton.exists)
        addButton.tap()

        let textField = app.textFields["Enter your name:"]
        XCTAssert(textField.exists)
        textField.tap()
        textField.typeText("Test Name")

        let textView = app.textViews["MessageTextView"]
        XCTAssert(textView.exists)
        textView.tap()
        textView.typeText("This is a test message.")

        let sendButton = app.navigationBars["New Message"].buttons["Send"]
        XCTAssert(sendButton.exists)
        sendButton.tap()

        let messageCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["This is a test message."]/*[[".cells.staticTexts[\"This is a test message.\"]",".staticTexts[\"This is a test message.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(messageCell.exists)
        XCTAssertTrue(messageCell.label == "This is a test message.")
        let backButton = app.navigationBars["A New Thread"].buttons["λ Message Board"]

        backButton.tap()

        let thread = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Testing again"]/*[[".cells.staticTexts[\"Testing again\"]",".staticTexts[\"Testing again\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(thread.exists)
        thread.tap()
        let newMessageCell = app.tables.staticTexts["TitleLabel"]

        XCTAssertTrue(newMessageCell.exists)
    }
}

