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
    
    let messageThreadsTableViewController = MessageThreadsTableViewController()
    let messageThreadController = MessageThreadController()
    
    func testLoadingMessageThread() {
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
    func testCreateThread() {
        messageThreadController.createMessageThread(with: "Test") {
            XCTAssertTrue(self.messageThreadController.messageThreads[0].title == "Test")
        }
    }
    
    func testCreateMessage() {
        messageThreadController.createMessageThread(with: "Test") {
            XCTAssertTrue(self.messageThreadController.messageThreads[0].title == "Test")
        }
    }
}
