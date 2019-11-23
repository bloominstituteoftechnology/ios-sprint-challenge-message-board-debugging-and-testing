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
    
    func testTitleAppears() {
        XCTAssertTrue(app.navigationBars.staticTexts["λ Message Board"].exists)
    }
    
    func testTableViewCellsExist() {
        XCTAssertNotNil(app.tables.cells)
    }
    
    func testThreadSelectionDetailDisplays() {
        app.selectStaticTableText(app, text: "Testing again")
        XCTAssertTrue(app.navigationBars["Testing again"].exists)
    }
    
    func testMessagesLoad() {
        app.selectStaticTableText(app, text: "Testing again")
        XCTAssertTrue(app.tables.cells.staticTexts["Bob"].exists)
    }
    
    func testSendingMessage() {
        app.selectStaticTableText(app, text: "Testing again")
        app.navigationBars["Testing again"].buttons["Add"].tap()
        
        app.enterTextForTextField(app: app, identifier: "nameTextField", text: "Bobby")
        app.enterTextForTextView(app: app, identifier: "messageTextView", text: "Hi from Bobby")

        app.navigationBars["New Message"].buttons["Send"].tap()

        let test = app.tables.cells.staticTexts["Bobby"]
        XCTAssertTrue(test.exists)
    }
    
}

extension XCUIApplication {
    
    func enterTextForTextField(app: XCUIApplication, identifier: String, text: String) {
        let selectedTextField = app.textFields["\(identifier)"]
        selectedTextField.tap()
        selectedTextField.typeText(text)
    }
    
    func enterTextForTextView(app: XCUIApplication, identifier: String, text: String) {
        let selectedTextView = app.textViews["\(identifier)"]
        selectedTextView.tap()
        selectedTextView.typeText(text)
    }
    
    func selectStaticTableText(_ app: XCUIApplication, text: String) {
        app.tables.staticTexts["\(text)"].tap()
    }
    
}
