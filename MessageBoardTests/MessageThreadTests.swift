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
     
     assertExpectations(expectation)
     XCTAssertEqual(controller.messageThreads.count, currentMessageThreadCount + 1)
     XCTAssertTrue(controller.messageThreads.contains(where: { $0.title == threadTitle }))
        
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
    
    // test creating new message
    func testCreatingNewMessage() {
        let messageThreadController = MessageThreadController()
        let threadTitle = "Thread created by: testCreatingNewMessage"
        createNewThread(withTitle: threadTitle, using: messageThreadController)
        
        let thread = messageThreadController.messageThreads.first(where: { $0.title == threadTitle})!
        thread.messages = []
        XCTAssertTrue(thread.messages.isEmpty)
        
        let text = "This is a sample message"
        let sender = "Sal"
        
        let expectation = self.expectation(description: "created a new message in thread: \(thread.title)")
        
        messageThreadController.createMessage(in: thread, withText: text, sender: sender) {
            expectation.fulfill()
        }
        
        assertExpectations(expectation)
        XCTAssertEqual(thread.messages.count, 1)
        XCTAssertEqual(thread.messages[0].sender, sender)
        XCTAssertEqual(thread.messages[0].messageText, text)
        
    }
    
    func testFetchingThreads() {
        let messageThreadController = MessageThreadController()
        
        createNewThread(withTitle: "Thread for fetching", using: messageThreadController)
        messageThreadController.messageThreads = []
        
        XCTAssertTrue(messageThreadController.messageThreads.isEmpty)
        let expectation = self.expectation(description: "fething threads from server")
        
        messageThreadController.fetchMessageThreads {
            expectation.fulfill()
        }
        
        assertExpectations(expectation)
        XCTAssertTrue(messageThreadController.messageThreads.isEmpty)
    }
    
    
}

 
