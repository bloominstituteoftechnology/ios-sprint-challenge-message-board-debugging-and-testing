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
        
        XCTAssertTrue(mtp.cellFor(0).staticTexts["Test Message"].label == "Test Message")
        XCTAssertFalse(mtp.cellFor(0).staticTexts["Test Message"].label == "Test Messae")
    }
    
}
