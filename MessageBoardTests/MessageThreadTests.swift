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
    
    // MARK: - Instances
    
    let messageThreadController = MessageThreadController()
    
    // MARK: - Tests

    func testNewThread() {
        messageThreadController.createMessageThread(with: "New Test") {
            XCTAssertFalse(self.messageThreadController.messageThreads.isEmpty)
        }
    }
    
    func testThreadExists() {
        messageThreadController.createMessageThread(with: "New Test") {
            XCTAssert(self.messageThreadController.messageThreads.last?.title == "New Test")
        }
    }
    
    func testThreadFetch() {
        messageThreadController.createMessageThread(with: "New Test") {
            self.messageThreadController.fetchMessageThreads {
                XCTAssertTrue(self.messageThreadController.messageThreads.count > 0)
            }
        }
    }
    
    func testMessageExists() {
        messageThreadController.createMessageThread(with: "New Test") {
            XCTAssert(self.messageThreadController.messageThreads.last?.title == "New Test")
            self.messageThreadController.createMessage(in: self.messageThreadController.messageThreads.last!, withText: "Testing 123.", sender: "Alex") {
                XCTAssert(self.messageThreadController.messageThreads.last?.messages.last?.messageText == "Testing 123.")
            }
        }
    }
    
    
    
}
