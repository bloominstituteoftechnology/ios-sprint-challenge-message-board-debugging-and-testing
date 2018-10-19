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
    
    // 1. Create a local thread
    
    func testCreateLocalThread() {
        let messageThreadController = MessageThreadController()
        messageThreadController.createLocalMessageThread(with: "Test Local Thread") {
            XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
        }
    }
    
    // 2. Create a thread
    
    func testCreateThread() {
        let messageThreadController = MessageThreadController()
        messageThreadController.createMessageThread(with: "Test Thread") {
            XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
        }
    }
    
    
    // 3. Create a local message
    
    func testCreateLocalMessage() {
        let messageThreadController = MessageThreadController()
        let thread = MessageThread(title: "Test local thread")
        messageThreadController.messageThreads.append(thread)
        messageThreadController.createLocalMessage(in: thread, withText: "Test Title", sender: "Testsender") {
            XCTAssertFalse(thread.messages.isEmpty)
        }
    }
    
    // 4. Create a message
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        let thread = MessageThread(title: "Test thread")
        messageThreadController.messageThreads.append(thread)
        messageThreadController.createMessage(in: thread, withText: "Test Title", sender: "Test sender") {
            XCTAssertFalse(thread.messages.isEmpty)
        }
    }
}
