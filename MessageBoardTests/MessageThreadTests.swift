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
    
    func testCreatingNewThread() {
        let messageThreadController = MessageThreadController()
        let existingMessageThreadCount = messageThreadController.messageThreads.count
        let threadTitle = "New Thread Title"
        XCTAssertEqual(messageThreadController.messageThreads.count, existingMessageThreadCount)
        
        let expectation = self.expectation(description: "Creating new message thread")
        
        messageThreadController.createMessageThread(with: threadTitle) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(messageThreadController.messageThreads.count, existingMessageThreadCount + 1)
        XCTAssertEqual(messageThreadController.messageThreads.last?.title, threadTitle)
    }
    
}
