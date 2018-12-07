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
    
    func testCreateMessageThread() {
        
        // bug 1) cannot create new thread
        
        let messageThreadsPage = MessageThreadsPage(testCase: self)
        
        messageThreadsPage.createMessageThread()
        .verifyMessageThreadCell(at: 0)
    }
    
    func testCreatingNewMessage() {
        
        // bug 2) clicking on send button not creating new message
        
    }
    
    func testFetchFromServer() {
        
        // bug 3) threads are not persisting, wont retrieve from firebase
        
    }
}
