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
    
    func testCreateMessage() {
        let newThreadTextField = app.tables["Empty list"]
            .textFields["Create a new thread:"]
        let newThreadTitle = "New thread title"
        newThreadTextField.tap()
        newThreadTextField.typeText(newThreadTitle)
        app.keyboards.buttons["Return"].tap()
        
        app.tables.staticTexts[newThreadTitle].tap()
        app.navigationBars[newThreadTitle].buttons["Add"].tap()
        
        let nameTextField = app.textFields["messageDetail.nameTextField"]
        let senderName = "jonbash"
        nameTextField.tap()
        nameTextField.typeText(senderName)
        
        let messageTextView = app.descendants(matching: .textView).element
        let messageText = "this is a new message"
        messageTextView.tap()
        messageTextView.typeText(messageText)
        
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        XCTAssertTrue(app.navigationBars[newThreadTitle].exists)
        XCTAssertTrue(app.tables.cells.staticTexts[messageText].exists)
        XCTAssertTrue(app.tables.cells.staticTexts[senderName].exists)
    }
    
}
