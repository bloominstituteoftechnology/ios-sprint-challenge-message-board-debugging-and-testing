//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadControllerTests: XCTestCase {
    
    func testCreateThreadIncreaseThreadCount() {
        let messageThreadController = MessageThreadController()
        
        let originalCount = messageThreadController.messageThreads.count
        
        let didFinish = expectation(description: "didFinish")
        
        messageThreadController.createMessageThread(with: "UItest") {
            didFinish.fulfill()
        }
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertEqual(originalCount + 1, messageThreadController.messageThreads.count)
    }
    
    func testLoadThreadCorrectCount() {
        let messageThreadController = MessageThreadController()
        
        XCTAssertGreaterThanOrEqual(0, messageThreadController.messageThreads.count)
        
        let didFinish = expectation(description: "didFinish")
        
        messageThreadController.fetchMessageThreads {
            didFinish.fulfill()
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertGreaterThan(messageThreadController.messageThreads.count, 0) // input number of message thread in server, do this test seperately
    }
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        
        let didFinish = expectation(description: "didFinish")
        
        let didCreateMessage = expectation(description: "didCreateMessage")
        
        messageThreadController.fetchMessageThreads {
            didFinish.fulfill()
        }
        
        wait(for: [didFinish], timeout: 5)
        let originalCount = messageThreadController.messageThreads[0].messages.count
        
        
        messageThreadController.createMessage(in: messageThreadController.messageThreads[0], withText: "new message test", sender: "brad") {
            didCreateMessage.fulfill()
        }
        wait(for: [didCreateMessage], timeout: 5)
        
        XCTAssertEqual(originalCount + 1, messageThreadController.messageThreads[0].messages.count)
    }
    
    
    
    
    
}
