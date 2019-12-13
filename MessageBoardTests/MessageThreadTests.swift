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
    
    func testAddingThreadToMessageBoard() {
        let messageThreadController = MessageThreadController()
        
        let messageThreadCreated = expectation(description: "Thread Created")
        messageThreadController.createMessageThread(with: "Test") {
            messageThreadCreated.fulfill()
        }
        
        wait(for: [messageThreadCreated], timeout: 5)
        
        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
    }
    
    func testAddingMessageToThread() {
        let messageThreadController = MessageThreadController()
        
        let messageThreadCreated = expectation(description: "Thread Created")
        messageThreadController.createMessageThread(with: "Test") {
            messageThreadCreated.fulfill()
        }
        
        wait(for: [messageThreadCreated], timeout: 5)
        
        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
        XCTAssertEqual(messageThreadController.messageThreads[0].title, "Test")
        
        let messageThread = messageThreadController.messageThreads[0]
        
        let messageCreated = expectation(description: "Message created for thread")
        messageThreadController.createMessage(in: messageThread, withText: "test", sender: "123") {
            messageCreated.fulfill()
        }
        
        wait(for: [messageCreated], timeout: 5)
        
        XCTAssertTrue(messageThreadController.messageThreads[0].messages.count > 0)
        XCTAssertEqual(messageThreadController.messageThreads[0].messages[0].text, "test")
        XCTAssertEqual(messageThreadController.messageThreads[0].messages[0].sender, "123")
    }
}
