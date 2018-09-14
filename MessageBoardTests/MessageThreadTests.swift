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
    func testAddingMessageToMessageThreads() {
        let messageThreadController = MessageThreadController()
        let messageThreadCount = messageThreadController.messageThreads.count
        let expectationForMessageThread = expectation(description: "Appended to thread successfully")

        messageThreadController.createMessageThread(with: "Test Message") {
            expectationForMessageThread.fulfill()
        }
        
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                XCTFail("Error with creating message thread \(error)")
            } else {
                XCTAssertNotEqual(messageThreadCount, messageThreadController.messageThreads.count)
            }
        }
    }
    
    func testDecodingMessageThreads() {
        
    }
}
