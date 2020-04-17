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
    
    private var threadTextField: XCUIElement {
        return app.textFields["MessageBoard.ThreadTitleTextField"]
    }
    func testCreateThread() {
        threadTextField.tap()
        threadTextField.typeText("Hi")
        app.buttons["Return"].tap()
        XCTAssert(app.tables.staticTexts["Hi"].exists)
    }
    
    private var nameText: XCUIElement {
        return app.textFields["MessageDetailViewController.SenderNameTextField"]
    }
    private var messageText: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextField"]
    }
    func testCreateMessage() {
        testCreateThread()
        app.tables.staticTexts["Hi"].tap()
        app.navigationBars.buttons["Add"].tap()
        
        nameText.tap()
        nameText.typeText("Lydia")
        
        messageText.tap()
        messageText.typeText("This is a test")
        
        app.navigationBars.buttons["Send"].tap()
        
        XCTAssert(app.tables.staticTexts["This is a test"].exists)
    }

    func testSegues() {
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars.buttons["Add"].tap()
        
        app.navigationBars.buttons["A New Thread"].tap()
        app.navigationBars.buttons["λ Message Board"].tap()
    }
}
