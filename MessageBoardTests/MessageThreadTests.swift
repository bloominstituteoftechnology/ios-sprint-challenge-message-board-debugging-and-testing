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
    
    let messageThreadController = MessageThreadController()

    // 1. Bug. Not creates a thread
    
    func testCreateLocalThread() {
        messageThreadController.createLocalMessageThread(with: "Test Local Thread") {
        }
        XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
    }
    
    // 2. Bug. Not fetching threads
    
    func testFetch() {
        messageThreadController.fetchMessageThreads {
        }
        XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
    }
    
    // 3. Create a message
    
    func testCreateMessage() {
        let thread = MessageThread(title: "Test thread")
        messageThreadController.messageThreads.append(thread)
        messageThreadController.createMessage(in: thread, withText: "Test Title", sender: "Test sender") {  }
        XCTAssertFalse(thread.messages.isEmpty)
    }
}
