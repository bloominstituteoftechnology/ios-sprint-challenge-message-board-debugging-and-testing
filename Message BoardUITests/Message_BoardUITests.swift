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
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateNewMessageThread() {
        MessageThreadsTableViewPage(testCase: self)
            .addNewThread(with: "New thread")
            .verifyThread()
    }
    
    func testCreateNewMessageInThread() {
        
        let msgText = "This is a new message"
        let sender = "Jason Modisett"
        
        MessageThreadsTableViewPage(testCase: self)
        .addNewThread(with: "New thread")
        .tapCell(at: 0)
        .tapAddMessageButton()
        .writeNewMessageWith(text: msgText, from: sender)
        .sendOrUpdateMessage()
        .verifyMessageData(at: 0)
    }
    
}
