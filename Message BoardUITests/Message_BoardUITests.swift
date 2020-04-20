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
    
     // Tap existing thread in table view and verify navigation to the detail table view for that thread.
       func testShowThreadDetail() {
           app.tables.cells.staticTexts["Testing 123"].tap()
           XCTAssertTrue(app.navigationBars["Testing 123"].exists)
           
       }
       
       func testPopViewFromNavigationStack() {
           app.navigationBars["Testing 123"].buttons["λ Message Board"].tap()
           XCTAssertTrue(app.navigationBars["λ Message Board"].exists)
       }
       
       // create a new thread from the table view and verify it populated a cell.
       func testCreateMessageThread() {
           let messageTextField = app.tables.textFields["Create a new thread:"]
           messageTextField.tap()
           messageTextField.typeText("Blah blah blah")
           app.keyboards.buttons["Return"].tap()
           
           XCTAssertTrue(app.tables.staticTexts["Blah blah blah"].exists)
           
       }
       
       // Tap on a thread to go to detail table view; tap on add button; create new message and verify it saved to the thread.
       func testCreateMessageFromThread() {
            app.tables.cells.staticTexts["Testing 123"].tap()
       
           app.navigationBars["Testing 123"].buttons["Add"].tap()
           
           let nameTextField = app.textFields["Enter your name:"]
           nameTextField.tap()
           nameTextField.typeText("Betsy Ross")
           
           let messageTextView = app.textViews.element
           XCTAssert(messageTextView.exists)
           messageTextView.tap()
           messageTextView.typeText("A flag for my countrymen.")
           
           app.navigationBars["New Message"].buttons["Send"].tap()

           XCTAssertTrue(app.tables.staticTexts["A flag for my countrymen."].exists)
       }
       }
