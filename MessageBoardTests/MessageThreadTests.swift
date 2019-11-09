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
    
    func testCreateThread() {
        let didFinish = expectation(description: "didFinish")
        messageThreadController.createMessageThread(with: "Unit Test Thread 1") {
            self.messageThreadController.fetchMessageThreads {
                didFinish.fulfill()
            }
        }
        wait(for: [didFinish], timeout: 30)
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
    func testMessageThreadsIsNotEmpty() {
        var messageThreads: [MessageThread] = []
        messageThreadController.fetchMessageThreads {
            messageThreads = self.messageThreadController.messageThreads
        }
        
        XCTAssertFalse(messageThreads.isEmpty)
    }
    
}
