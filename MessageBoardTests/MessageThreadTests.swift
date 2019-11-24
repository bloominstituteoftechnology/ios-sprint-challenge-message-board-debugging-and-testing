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
    
    func testFetchThreadsFromServer() {
       
        let expectation = self.expectation(description: "Fetching")
        let messageThreadController = MessageThreadController()
        
        messageThreadController.fetchMessageThreads {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
    func testCreateNewThread() {
        
        let messageThreadController = MessageThreadController()
        let expectation = self.expectation(description: "Creating and Fetching")
        
        messageThreadController.createMessageThread(with: "Test Create New Thread") {
            messageThreadController.fetchMessageThreads {
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        var threadTitleCheck: Bool = false
        
        for thread in messageThreadController.messageThreads {
            if thread.title == "Test Create New Thread" {
                threadTitleCheck = true
            }
        }
        XCTAssertTrue(threadTitleCheck)
    }
    
    func testCreateNewMessageInThread() {
        
        let messageThreadController = MessageThreadController()
        let fetchExpectation = self.expectation(description: "Fetching Threads")
        
        var thread: MessageThread?
        
        messageThreadController.fetchMessageThreads {
            thread = messageThreadController.messageThreads[0]
            fetchExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        let createExpectation = self.expectation(description: "Creating Message")
        guard let messageThread = thread else { return }
        
        messageThreadController.createMessage(in: messageThread, withText: "TestCreateNewMessageInThread", sender: "XCTEST") {
            createExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        var messages: [MessageThread.Message?] = []
        
        for thread in messageThreadController.messageThreads {
            if thread == messageThread {
                messages = thread.messages
            }
        }
        
        var messageWasAdded: Bool = false
        
        for message in messages {
            if message?.messageText == "TestCreateNewMessageInThread" && message?.sender == "XCTEST" {
                messageWasAdded = true
            }
        }
        
        XCTAssertTrue(messageWasAdded)
        
    }
    
}
