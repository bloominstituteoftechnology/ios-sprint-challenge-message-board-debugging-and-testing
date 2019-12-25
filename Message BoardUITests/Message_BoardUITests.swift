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
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    var searchBar: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.TextField"]
    }
    
    func testCreateThread() {
        searchBar.tap()
        searchBar.typeText("UI Test")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssert(app.tables.cells.staticTexts["UI Test"].exists)
    }
    
    func testCreateMessage() {
        searchBar.tap()
        searchBar.typeText("UI Test")
        app.keyboards.buttons["Return"].tap()
        
        let cell = app.tables.cells.staticTexts["UI Test"]
        XCTAssert(cell.exists)
        cell.tap()
        
        let createButton = app.buttons["Add"]
        XCTAssert(createButton.exists)
        createButton.tap()
        
        let nameField = app.textFields["Enter your name:"]
        let messageField = app.textViews.element(boundBy: 0)
        let sendButton = app.buttons["Send"]
        XCTAssert(nameField.exists)
        XCTAssert(messageField.exists)
        XCTAssert(sendButton.exists)
        
        nameField.tap()
        nameField.typeText("Lisa")
        messageField.tap()
        messageField.typeText("This is a UI test.")
        sendButton.tap()
        
        XCTAssert(app.tables.cells.staticTexts["Lisa"].exists)
        XCTAssert(app.tables.cells.staticTexts["This is a UI test."].exists)
    }
    
}
