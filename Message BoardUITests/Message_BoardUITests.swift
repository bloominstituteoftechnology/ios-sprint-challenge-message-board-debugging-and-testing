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
    
    func testExample() {
        MessageThreadsTablePage(testCase: self)
        .createThread(withTitle: "Hello")
        .tapOnCell(at: 0)
        .tapOnAddBarButton()
        .enterSenderName(text: "Sammie")
        .enterMessageText(text: "This is a message text")
        .tapOnSendBarButton()
    }
}
