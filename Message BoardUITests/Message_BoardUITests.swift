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
    
    func testExample() throws {
        // USE this to test functionality and record what the application is capable of performing. A user can create a thread. Access the thread to create a message and send the message.
    }
    
    func testCreatingThread() {
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Create a new thread:"].tap()
        tablesQuery.cells.staticTexts["Hello"]
    }
    
    func testAccessingThread() {
        app.tables.staticTexts["A New Thread"].tap()
    }
    
    func testAddButton() {
        app.tables.staticTexts["A New Thread"].tap()
        let addButton = app.navigationBars["A New Thread"].buttons["Add"]
        addButton.tap()
    }
    
    func testSendButton() {
        app.tables.staticTexts["A New Thread"].tap()
        let addButton = app.navigationBars["A New Thread"].buttons["Add"]
        addButton.tap()
        let newMessageNavigationBar = app.navigationBars["New Message"]
        let sendButton = newMessageNavigationBar.buttons["Send"]
        sendButton.tap()
    }
    
    func testCancelButton() {
        app.tables.staticTexts["A New Thread"].tap()
        let addButton = app.navigationBars["A New Thread"].buttons["Add"]
        addButton.tap()
        let newMessageNavigationBar = app.navigationBars["New Message"]
        newMessageNavigationBar.buttons["Cancel"].tap()
    }
    
    func testCreatingMessage() {
        app.tables.staticTexts["A New Thread"].tap()
        let addButton = app.navigationBars["A New Thread"].buttons["Add"]
        addButton.tap()
        let enterYourNameTextField = app.textFields["Enter your name:"]
        enterYourNameTextField.tap()
    }
}
