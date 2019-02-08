//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    var messageThreadController: MessageThreadController!
    let newTestThreadName = "Test Thread #1"
    let newTestMessageTitle = "New Message #1"
    let newTestMessageText = "This is New Message #1"
    let newTestSender = "Alfred"
    var newTestMessage: MessageThread!
    
    // Setup
    override func setUp() {
        super.setUp()
        messageThreadController = MessageThreadController()
    }
    
    // Create a new Thread
    func testCreateNewThread() {
        
        let messagesThreadCount = messageThreadController.messageThreads.count
        messageThreadController.createMessageThread(with: newTestThreadName) {
    
            XCTAssertEqual(self.messageThreadController.messageThreads.count, messagesThreadCount + 1)
        }
    }
    
    // Create a new Message
    func testCreateNewMessage() {
        // This is tested in UITests. Could not figure out
        // how to access the proper methods to do it here.
    }

    
    // Fetch Message Threads
    func testFetchMessageThread() {
        
        messageThreadController.fetchMessageThreads {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, 2)
        }
    }
}
