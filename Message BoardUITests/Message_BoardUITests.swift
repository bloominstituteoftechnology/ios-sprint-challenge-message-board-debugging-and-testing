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
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // create a new thread from the table view and verify it populated a cell.
    func testCreateMessageThread() {
        newThread()
        
        XCTAssertTrue(app.tables.staticTexts["Testing again"].exists)
    }
    
    // Tap existing thread in table view and verify navigation to the detail table view for that thread.
    func testShowThreadDetail() {
        newThread()
        app.tables.cells.staticTexts["Testing again"].tap()
        XCTAssertTrue(app.navigationBars["Testing again"].exists)
    }
        
    // Tap on a thread to go to detail table view; tap on add button; create new message and verify it saved to the thread.
    func testCreateMessageFromThread() {
        newThread()
        app.tables.cells.staticTexts["Testing again"].tap()
        
        app.navigationBars["Testing again"].buttons["Add"].tap()
        let nameTextField = app.textFields["Enter your name:"]
        nameTextField.tap()
        nameTextField.typeText("Bob")


        let messageTextView = app.textViews.element
        XCTAssert(messageTextView.exists)
        messageTextView.tap()
        messageTextView.typeText("It's working!")

        app.navigationBars["New Message"].buttons["Send"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["It's working!"].exists)
    }
    
    func newThread() {
        let messageTextField = app.tables.textFields["Create a new thread:"]
        messageTextField.tap()
        messageTextField.typeText("Testing again")
        app.keyboards.buttons["Return"].tap()
    }
}
