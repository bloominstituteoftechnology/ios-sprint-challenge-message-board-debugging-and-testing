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
        createNewThread(withTitle: "New Thread Title", using: messageThreadController)
    }
    
    func testFetchingThreads() {
        let messageThreadController = MessageThreadController()
        
        // Create a new thread and PUT it to the server
        // This ensures there is at least one thread on the server before fetching
        createNewThread(withTitle: "New Thread Title", using: messageThreadController)
        
        // Empty messageThreadController's messageThreads array and
        // Test fetching the newly created thread from the server
        messageThreadController.messageThreads = []
        XCTAssertTrue(messageThreadController.messageThreads.isEmpty)
        
        let expectation = self.expectation(description: "Fetching message threads from server")
        
        messageThreadController.fetchMessageThreads {
            expectation.fulfill()
        }
        
        assertExpectation(expectation)
        
        XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
    }
    
    fileprivate func createNewThread(withTitle threadTitle: String, using controller: MessageThreadController) {
        let existingMessageThreadCount = controller.messageThreads.count
        let expectation = self.expectation(description: "Creating new message thread")
        
        controller.createMessageThread(with: threadTitle) {
            expectation.fulfill()
        }
        
        assertExpectation(expectation)
        
        XCTAssertEqual(controller.messageThreads.count, existingMessageThreadCount + 1)
        XCTAssertTrue(controller.messageThreads.contains(where: { $0.title == threadTitle }))
    }
    
    fileprivate func assertExpectation(_ expectation: XCTestExpectation, timeout: Double = 5.0) {
        waitForExpectations(timeout: timeout) { error in
            if let error = error {
                XCTAssert(false, "\(error)")
            }
        }
    }
    
}
