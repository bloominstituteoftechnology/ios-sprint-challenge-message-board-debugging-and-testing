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
    
    private var newThreadTextField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    private var nameTextField: XCUIElement {
        return app.textFields["Enter your name:"]
    }
    
    private var messageView: XCUIElement {
        return app.textViews.element(boundBy: 0)
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateNewThread() {
        newThreadTextField.tap()
        newThreadTextField.typeText("Hurry and create it rn")
        app.buttons["Return"].tap()
        
        XCTAssert(app.tables.staticTexts["Hurry and create it rn"].exists)
    }
    
    func testThreadTitle() {
        newThreadTextField.tap()
        newThreadTextField.typeText("Hurry and create it rn")
        app.buttons["Return"].tap()
        
        XCTAssert(app.tables.staticTexts["Hurry and create it rn"].exists)
        
        app.tables.staticTexts["Hurry and create it rn"].tap()
        
        XCTAssert(app.navigationBars["Hurry and create it rn"].exists)
    }
    
    func testCreateNewMessage() {
        newThreadTextField.tap()
        newThreadTextField.typeText("Hurry and create it rn")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssert(app.tables.staticTexts["Hurry and create it rn"].exists)
        
        app.tables.staticTexts["Hurry and create it rn"].tap()
        app.navigationBars["Hurry and create it rn"].buttons["Add"].tap()
        nameTextField.tap()
        nameTextField.typeText("Kent Clark")
        messageView.tap()
        messageView.typeText("Mansuper")
        app.buttons["Send"].tap()
        
        XCTAssert(app.tables.staticTexts["Mansuper"].exists)
    }
    
    func testCancelNewMessage() {
        newThreadTextField.tap()
        newThreadTextField.typeText("Hurry and create it rn")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssert(app.tables.staticTexts["Hurry and create it rn"].exists)
        
        app.tables.staticTexts["Hurry and create it rn"].tap()
        app.navigationBars["Hurry and create it rn"].buttons["Add"].tap()
        nameTextField.tap()
        nameTextField.typeText("Kent Clark")
        messageView.tap()
        messageView.typeText("Mansuper")
        app.buttons["Cancel"].tap()
        
        XCTAssertFalse(app.tables.staticTexts["Mansuper"].exists)
    }
}
