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
        let messageTheadController = MessageThreadController()
        let exisitingMessageThreadCount = messageTheadController.messageThreads.count
        let threadTitle = "New Thread Title"
        XCTAssertEqual(messageTheadController.messageThreads.count, exisitingMessageThreadCount)
        
        let expectation = self.expectation(description: "Creating new thread")
        
        messageTheadController.createMessageThread(with: threadTitle) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertEqual(messageTheadController.messageThreads.count, exisitingMessageThreadCount + 1)
        XCTAssertEqual(messageTheadController.messageThreads.last?.title, threadTitle)
    }

}
