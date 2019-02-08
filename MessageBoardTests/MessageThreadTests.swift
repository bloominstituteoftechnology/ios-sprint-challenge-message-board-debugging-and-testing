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
    
    // Setup
    override func setUp() {
        super.setUp()
        messageThreadController = MessageThreadController()
    }
    
    // Create a new Thread
    func testCreateNewThread() {
        
        let messagesCount = messageThreadController.messageThreads.count
        messageThreadController.createMessageThread(with: newTestThreadName) {
    
            XCTAssertEqual(self.messageThreadController.messageThreads.count, messagesCount + 1)
        }
    }
    
    // Create a new Message - maybe do this inside new thread makes more sense?
    func testCreateNewMessage() {
        
    }
    
    // Fetch Message Threads
    func testFetchMessageThread() {
        
        messageThreadController.fetchMessageThreads {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, 2)
        }
    }
}
