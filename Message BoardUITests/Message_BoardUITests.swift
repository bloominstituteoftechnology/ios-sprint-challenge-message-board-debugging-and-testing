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
    
    func testUIAddingMessageThreadToMessageThreads() {
        let mtp = MessageThreadPage(testCase: self)
        
        mtp.newThreadTextField.tap()
        mtp.newThreadTextField.typeText("Test Message")
        mtp.pressEnter()
        
        XCTAssertTrue(mtp.messageIs("Test Message", index: 0, expectedMessage: "Test Message"))
        XCTAssertFalse(mtp.messageIs("Test Message", index: 0, expectedMessage: "Test Mesage"))
    }
    
    func testUIAddingMessageToThreadAddsMessage() {
        let mtp = MessageThreadPage(testCase: self)
        mtp.newThreadTextField.tap()
        mtp.newThreadTextField.typeText("Test Message")
        mtp.pressEnter()
        
        mtp.tapOnCell(cellIndex: 0)
            .tapOnAddButton()
            .tapOnNameTextField()
        mtp.addMessageTextField.typeText("Test Message")
        
        mtp.tapOnMessageTextView()
        mtp.addMessageTextView.typeText("Test Message Text")
        mtp.tapOnSaveButton()
        
        mtp.tapOnCell(cellIndex: 0)
            .tapOnAddButton()
            .tapOnNameTextField()
        mtp.addMessageTextField.typeText("Test Message2")
        
        mtp.tapOnMessageTextView()
        mtp.addMessageTextView.typeText("Test Message Text2")
        mtp.tapOnSaveButton()
     
        
        XCTAssertTrue(XCUIApplication().staticTexts["Test Message2"].exists)
        XCTAssertTrue(XCUIApplication().staticTexts["Test Message"].exists)
        XCTAssertFalse(XCUIApplication().staticTexts["Test Message3"].exists)
        
    }
    
    func testUIAddingMessageToThreadPopsNavigation() {
        let mtp = MessageThreadPage(testCase: self)
        mtp.newThreadTextField.tap()
        mtp.newThreadTextField.typeText("Test Message")
        mtp.pressEnter()
        
        mtp.tapOnCell(cellIndex: 0)
            .tapOnAddButton()
            .tapOnNameTextField()
        mtp.addMessageTextField.typeText("Test Message")
        
        mtp.tapOnMessageTextView()
        mtp.addMessageTextView.typeText("Test Message Text")
        mtp.tapOnSaveButton()
        
        XCTAssertTrue(mtp.currentNavigationBar.identifier == "Test Message")
    }
    
}
