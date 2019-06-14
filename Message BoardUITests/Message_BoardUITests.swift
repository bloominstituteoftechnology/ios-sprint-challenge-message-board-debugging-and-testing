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
        let searchBar = app.tables["Empty list"].textFields["Create a new thread:"]

        searchBar.tap()
        searchBar.typeText("UI Test Thread")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssert(app.tables.cells.staticTexts["UI Test Thread"].exists)
    }
    
    func testCreateMessage() {
        
        let app = XCUIApplication()
        let searchBar = app.tables["Empty list"].textFields["Create a new thread:"]
        
        searchBar.tap()
        searchBar.typeText("UI Test Thread")
        app.keyboards.buttons["Return"].tap()
        
        let cell = app.tables.cells.staticTexts["UI Test Thread"]
        XCTAssert(cell.exists)
        
        cell.tap()
        let addButton = app.buttons["Add"]
        XCTAssert(addButton.exists)
        addButton.tap()
        
        let name = app.textFields["Enter your name:"]
        XCTAssert(name.exists)
        let message = app.textViews.element(boundBy: 0)
        XCTAssert(message.exists)
        let sendButton = app.buttons["Send"]
        XCTAssert(sendButton.exists)
        
        name.tap()
        name.typeText("Christopher Aronson")
        
        message.tap()
        message.typeText("This is a UI Test message types from code....The AI is taking over!!!!")
        
        sendButton.tap()
        
        let messageCell = app.tables.cells.staticTexts["Christopher Aronson"]
        XCTAssert(messageCell.exists)

    }
}
