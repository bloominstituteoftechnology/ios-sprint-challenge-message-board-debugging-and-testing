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
        
        app.launchArguments = ["UITesting"] // IMPORTANT for mocking data !!!
        app.launch()
    }
    
    func testCreateThread() {
        let messageThreadPage = MessageThreadPage(testCase: self)
        
        messageThreadPage.newThreadTextField.tap()
        messageThreadPage.newThreadTextField.typeText("Test Thread")
        messageThreadPage.pressReturn()
        
        .verifyThreadCreated("Test Thread", index: 0, text: "Test Thread")
    }
    
    func testAddMessage() {
        let messageThreadPage = MessageThreadPage(testCase: self)
        messageThreadPage.newThreadTextField.tap()
        messageThreadPage.newThreadTextField.typeText("Test Thread")
        messageThreadPage.pressReturn()
        
        messageThreadPage.tapOnCell(cellIndex: 0)
        .tapOnAddButton()
        .tapOnNameTextField()
        messageThreadPage.addMessageTextField.typeText("Test Sender")
        
        messageThreadPage.tapOnMessageTextView()
        messageThreadPage.addMessageTextView.typeText("Test Body")
        messageThreadPage.tapOnSaveButton()
        
        XCTAssertTrue(XCUIApplication().staticTexts["Test Thread"].exists)
    }
}
