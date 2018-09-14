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
    
    func testApp() {
        let threadTitle = "This is a UI test thread"
        let senderName = "Sammie"
        let messageText = "This is a message text"
        
        MessageThreadsTablePage(testCase: self)
            .createThread(withTitle: threadTitle)
            .verifyCellWasCreated(for: threadTitle)
            
            .tapOnCell(at: 2)
            .verfiyTitle(forThread: threadTitle)
            
            .tapOnAddBarButton()
            .enterSenderName(text: senderName)
            .enterMessageText(text: messageText)
            
            .verifySenderNameWasEntered(name: senderName)
            .verifyMessageTextWasEntered(text: messageText)
            
            .tapOnSendBarButton()
            .verifyCellWasCreated(with: senderName)
            .verifyCellWasCreated(with: messageText)
    }
}
