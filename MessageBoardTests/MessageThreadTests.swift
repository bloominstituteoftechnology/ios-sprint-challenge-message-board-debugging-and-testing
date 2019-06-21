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
    
    
    func testCreateMessageThread() {
        
        let messageThreadController = MessageThreadController()
        messageThreadController.createMessageThread(with: "TestThread") {
            XCTAssertEqual(messageThreadController.messageThreads.last?.title, "TestThread")
        }
        
    }
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        messageThreadController.createMessageThread(with: "TestThread") {
            XCTAssertEqual(messageThreadController.messageThreads.last?.title, "TestThread")
            messageThreadController.createMessage(in: messageThreadController.messageThreads.last!, withText: "TestMessage", sender: "Kobe") {
                XCTAssertEqual(messageThreadController.messageThreads.last?.messages.last?.messageText, "TestMessage")
            }
        }
    }
    
    
    func testFetchMessageThread() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.fetchMessageThreads {
            XCTAssert(!messageThreadController.messageThreads.isEmpty)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
