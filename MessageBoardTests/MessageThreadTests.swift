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
    func testAddingMessageThreadToMessageThreads() {
        let messageThreadController = MessageThreadController()
        let messageThreadCount = messageThreadController.messageThreads.count
        let expectationForMessageThread = expectation(description: "Appended to thread successfully")

        messageThreadController.createMessageThread(with: "Test Message") {
            expectationForMessageThread.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                XCTFail("Error with expectation: \(error)")
            } else {
                XCTAssertNotEqual(messageThreadCount, messageThreadController.messageThreads.count)
            }
        }
    }
    
    func testDecodingMessageThreads() {
        let messageThreadController = MessageThreadController()
        let messageThreadCount = messageThreadController.messageThreads.count
        
        let expectationForDecoding = expectation(description: "Decoded message threads successfully")
        let expectationForMessageThreadCount = expectation(description: "Add 1 MessageThread")
        
        messageThreadController.createMessageThread(with: "Test Decoding") {
            expectationForMessageThreadCount.fulfill()
        }
        
        messageThreadController.fetchMessageThreads {
            expectationForDecoding.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                XCTFail("Error with expectation: \(error)")
            } else {
                XCTAssertNotEqual(messageThreadCount, messageThreadController.messageThreads.count)
            }
        }
    }
    
    func testAddingMessageToMessageThread() {
        
    }
}
