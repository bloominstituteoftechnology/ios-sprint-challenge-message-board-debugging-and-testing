//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.TextView"]
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    private func createThreadExample() -> XCUIElement {
        let createTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        createTextField.tap()
        createTextField.typeText("UI Test 1")
        return createTextField
    }
    
    func testCreateNewThread() {
        try! setUpWithError()

      // createThreadExample()
        let createTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        createTextField.tap()
        createTextField.typeText("UI Test 1")
        app.keyboards.buttons["return"].tap()
        XCTAssert(app.tables.cells.staticTexts["UI Test 1"].exists)
    }

    func testCreateNewMessage() {
        try! setUpWithError()
        
       
        app.tables.staticTexts["UI Test 1"].tap()
    }

    func testCheckThreadMessages() {
        try! setUpWithError()
        
       
        app.tables.staticTexts["UI Test 1"].tap()
        app.navigationBars["UI Test 1"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.textFields["Enter your name:"].typeText("Bohdan")
        messageTextView.tap()
        messageTextView.typeText("Hey! The test is still going!")
        app.navigationBars["New Message"].buttons["Send"].tap()
        XCTAssert(app.tables.cells.staticTexts["Bohdan"].exists)
    }

    func testCancelMessage() {
        try! setUpWithError()

        app.tables.staticTexts["UI Test 1"].tap()
        let NavigationBar = app.navigationBars["UI Test 1"]
        let StaticText = NavigationBar.staticTexts["UI Test 1"]
        StaticText.tap()
        NavigationBar.buttons["Add"].tap()
        app.navigationBars["New Message"].buttons["Cancel"].tap()
        StaticText.tap()
        XCTAssertEqual(StaticText.label, "UI Test 1")
    }

}




