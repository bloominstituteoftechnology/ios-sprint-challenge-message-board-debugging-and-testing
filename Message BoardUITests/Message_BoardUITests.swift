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

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testInitialState() {
        XCTAssertTrue(app.tables.cells.count > 0)
    }
    
    func testTapOnMessageThreadAndTapBack() {
        let cellCount = app.tables.cells["MessageThreadsTableViewController.ThreadCell"].cells.count
        for index in 0..<cellCount {
            app.tables.cells["MessageThreadsTableViewController.ThreadCell"].cells.element(boundBy: index).tap()
            app.navigationBars.buttons["λ Message Board"].tap()
        }
    }
    
    func testCreateNewThread() {
        let newThreadTextField = app.tables.textFields["MessageThreadsTableViewController.CreateNewThread"]
        newThreadTextField.tap()
        newThreadTextField.typeText("Test New Thread")
        newThreadTextField.tap()
        XCTAssertTrue(app.tables.cells["Test New Thread"].exists)
    }
    
    func testAddNewMessageToThread() {
        app.tables.cells.element(boundBy: 0).tap()
        app.navigationBars.buttons["Add"].tap()
        let nameField = app.textFields["MessageDetailViewController.NameTextField"]
        nameField.tap()
        nameField.typeText("UI Tester")
        
        let messageField = app.textFields["MessageDetailViewController.MessageTextField"]
        messageField.tap()
        messageField.typeText("This is a test message.")
        
        app.navigationBars.buttons["Send"].tap()
        
        
    }
}
