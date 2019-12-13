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
    
    // Testing bug 4
    func testFetchMessageThreads() {
        let waitForThreadFetch = expectation(description: "Wait for threads fetched")
        messageThreadController.fetchMessageThreads {
            waitForThreadFetch.fulfill()
        }
        wait(for: [waitForThreadFetch], timeout: 2)
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
    func testCreateThread() {
        let waitForThreadCreation = expectation(description: "Wait for thread creation")
        messageThreadController.createMessageThread(with: "Unit Test iOS 11 Thread Creation 1") {
            waitForThreadCreation.fulfill()
        }
        
        wait(for: [waitForThreadCreation], timeout: 2)
        XCTAssertEqual(messageThreadController.messageThreads.count, 1)
    }
    
}
