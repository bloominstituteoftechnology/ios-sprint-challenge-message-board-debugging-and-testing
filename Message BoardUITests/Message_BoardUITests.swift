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
    
    func testCreateMessage() {
        
        MessageTestsPage(testCase: self)
            .tapOnAddButton()
        MessageDetailTests(testCase: self)
            .textEntryTextField()
            .textEntryTextView()
            .tapOnSendButton()
    }
    
    func testCell() {
        
//        MessageTestsPage(testCase: self)
//            .messageCellExists()
        MessageTestsPage(testCase: self)
            .getCell(index: 0)
    }
    
    func testCreateThread() {
        
        TestMessageThreads(testCase: self)
            .AddTextTitleTextField(with: "Test")
    }
    
    func testNavigation() {
        
        MessageTestsPage(testCase: self)
            .tapOnAddButton()
        MessageDetailTests(testCase: self)
            .tapOnSendButton()
        MessageTestsPage(testCase: self)
            .tapOnBackButton
    }
    
}
