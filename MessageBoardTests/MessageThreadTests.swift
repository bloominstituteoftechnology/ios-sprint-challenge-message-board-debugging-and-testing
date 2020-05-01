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
    
    // create new thread func
    func createNewThread(withTitle threadTitle: String, using controller: MessageThreadController) {
        let currentMessageThreadCount = controller.messageThreads.count
        let expectation = self.expectation(description: "New message thread has been created")
        
        controller.createMessageThread(with: threadTitle) {
            expectation.fulfill()
        }
        
    }
    // asserting expectations
    func assertExpectations(_ expectation: XCTestExpectation, timeout: Double = 7.0) {
        waitForExpectations(timeout: timeout) { (error) in
            if let error = error {
                XCTAssert(false, "\(error)")
            }
        }
    }
    
    
    // create a new thread test
    func testCreateNewThread() {
        let messageThreadController = MessageThreadController()
        createNewThread(withTitle: "Testing New Thread Title xx", using: messageThreadController)
    }
    
    
}
