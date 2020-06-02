//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    var createThread: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    var senderName: XCUIElement {
        return app.textFields["Enter your name:"]
    }
    
    var messageText: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreatingThread() {
        createThread.tap()
        createThread.typeText("Another Test")
        app.keyboards.buttons["Return"].tap()
        XCTAssertTrue(app.tables.staticTexts["Another Test"].exists)
    }
    
    func testCreatingMessage() {
        createThread.tap()
        createThread.typeText("Another Test")
        app.keyboards.buttons["Return"].tap()
        
        let thread = app.tables.staticTexts["Another Test"]
        XCTAssertTrue(thread.exists)
        
        thread.tap()
        app.navigationBars.buttons["Add"].tap()
        
        senderName.tap()
        senderName.typeText("Don")
        
        messageText.tap()
        messageText.typeText("This is a test.")
        
        app.navigationBars.buttons["Send"].tap()
        
        let message = app.tables.staticTexts["This is a test"]
        XCTAssertTrue(message.exists)
    }
    
}
