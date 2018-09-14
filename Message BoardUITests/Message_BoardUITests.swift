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
    
    func testCreatingThreads() {
        MessageThreadPage(testCase: self)
        .createThread(title: "Test with UITesting")
        .tapOnCell(at: 0)
        MessagesPage(testCase: self)
        .tapAddButton()
        DetailMessagePage(testCase: self)
        .typeSenderInTextField(text: "Lisa")
        .typeMessageInTextView(text: "This is a test with UITesting")
        .tapOnSendButton()
    }
    
}
