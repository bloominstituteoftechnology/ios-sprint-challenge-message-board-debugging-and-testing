//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - properties
    
    var app: XCUIApplication {
        return XCUIApplication()
    }

    // MARK: - VC Lifecycle
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Tests
    
    func testCreateThread() {
        let searchTF = app.textFields["Create a new thread:"]
        searchTF.tap()
        
        searchTF.typeText("Testing123 Thread")
        app.keyboards.buttons["Return"].tap()
        
        let newThread = app.staticTexts["Testing123 Thread"]
        XCTAssert(newThread.exists)
        newThread.tap()
        
        let backBtn = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssert(backBtn.exists)
        backBtn.tap()
    }
    
    func testCreateMessage() {
        let searchTF = app.textFields["Create a new thread:"]
        searchTF.tap()
        
        searchTF.typeText("Testing123 Thread")
        app.keyboards.buttons["Return"].tap()
        
        let newThread = app.staticTexts["Testing123 Thread"]
        newThread.tap()
        
        let composeBtn = app.buttons["Add"]
        composeBtn.tap()
        
        let enterNameTF = app.textFields["Enter your name:"]
        enterNameTF.tap()
        enterNameTF.typeText("Enzo")
        
        let enterMsgTV = app.textViews.element(boundBy: 0)
        enterMsgTV.tap()
        enterMsgTV.typeText("This is a test")
        
        let sendBtn = app.buttons["Send"]
        XCTAssert(sendBtn.exists)
        sendBtn.tap()
        
        let newMsg = app.tables.cells.staticTexts["Enzo"]
        XCTAssert(newMsg.exists)
        newMsg.tap()

    }

}
