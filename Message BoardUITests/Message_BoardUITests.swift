//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Test to create new thread on first table controller & show it on cell
    func testCreateMessageThread() {
        let messageTextField = app.tables.textFields["Create a new thread:"]
        messageTextField.tap()
        messageTextField.typeText("testy test test")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["testy test test"].exists)
    }
    
    // MARK: - Test to click on thread and navigated to the ThreadDetailViewController
    func testShowThreadDetail() {
        app.tables.cells.staticTexts["A New Thread"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["A New Thread"].exists)
    }
    
    // MARK: - Test to click on thread and add title and message, press send button and see it added to thread (failing)
    func testCreateMessageFromThread() {
      
        app.tables.cells.staticTexts["A New Thread"].tap()
        app.navigationBars["Title"].buttons["Add"].tap()
        
        let nameTextField = app.textFields["Enter your name:"]
        nameTextField.tap()
        nameTextField.typeText("Beyonce")
//        sleep(1)
        let messageTextView = app.textViews.element
        XCTAssert(messageTextView.exists)
        messageTextView.tap()
        messageTextView.typeText("Knowles")
        
        app.navigationBars["New Message"].buttons["Send"].tap()
        XCTAssertTrue(app.tables.staticTexts["Knowles"].exists)
    }
 
}
