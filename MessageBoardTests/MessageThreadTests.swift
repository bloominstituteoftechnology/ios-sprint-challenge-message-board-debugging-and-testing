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
    
    func testDataTaskRuns() {
        
        let messageThreadController = MessageThreadController()
        
        let count = messageThreadController.messageThreads.count
        let expectation = XCTestExpectation(description: "Wait for data task.")
                
        messageThreadController.createMessageThread(with: "Test") {
            XCTAssertNotEqual(messageThreadController.messageThreads.count, count)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
                
    }
    
    func testFetchDataTask() {
        let messageThreadController = MessageThreadController()
        let count = messageThreadController.messageThreads.count
        let expectation = XCTestExpectation(description: "Wait for data task.")
                
        messageThreadController.fetchMessageThreads {
            XCTAssertNotEqual(messageThreadController.messageThreads.count, count)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        let expectation = XCTestExpectation(description: "Wait for data task.")
        
        messageThreadController.createMessageThread(with: "Message Test") {
            messageThreadController.createMessage(in: messageThreadController.messageThreads[0], withText: "Testing...", sender: "Cora") {
                XCTAssert(messageThreadController.messageThreads[0].messages[0].text == "Testing...")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
}
