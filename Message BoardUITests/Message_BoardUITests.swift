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
    
    func testSendButtonDismissesMessageDetailView() {
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()
        let textField = app.textFields["Enter your name:"]
        textField.tap()
        textField.typeText("Chad \n")
        let textView = app.textViews["MessageTextView"]
        textView.tap()
        textView.typeText("Hello Class!\n")
        app.navigationBars["New Message"].buttons["Send"].tap()
        XCTAssert(app.navigationBars["A New Thread"].exists)
    }
    
    func testCreateThread() {
        let textField = app.tables.textFields["Create a new thread:"]
        textField.tap()
        textField.typeText("Students")
        textField.typeText("\n")
        XCTAssert(app.tables.staticTexts["Students"].exists)
    }
    
    func testMessageDisplaysInThread() {
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()
        let textField = app.textFields["Enter your name:"]
        textField.tap()
        textField.typeText("Chad\n")
        let textView = app.textViews["MessageTextView"]
        textView.tap()
        textView.typeText("Hello Class!")
        app.navigationBars["New Message"].buttons["Send"].tap()
        XCTAssert(app.tables.staticTexts["Hello Class!"].exists)
    }
}
