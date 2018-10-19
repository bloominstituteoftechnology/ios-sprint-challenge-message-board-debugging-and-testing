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
    
    func testCreateNewThread() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "TestThread") { (_) in
            XCTAssertEqual(messageThreadController.messageThreads.count, 1)
            XCTAssertEqual(messageThreadController.messageThreads.first?.title, "TestThread")
            XCTAssertEqual(messageThreadController.messageThreads.first?.messages, [])
        }
    }
    
    func testFetchMessageThreads() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.fetchMessageThreads { (_) in
            XCTAssertEqual(messageThreadController.messageThreads.count, 1)
            XCTAssertEqual(messageThreadController.messageThreads.first?.title, "Thread1")
            XCTAssertEqual(messageThreadController.messageThreads.first?.messages, [])
        }
    }
    
    func testCreateNewMessage() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "TestThread") { (_) in
            XCTAssertEqual(messageThreadController.messageThreads.count, 1)
            XCTAssertEqual(messageThreadController.messageThreads.first?.title, "TestThread")
            XCTAssertEqual(messageThreadController.messageThreads.first?.messages, [])
            if let thread = messageThreadController.messageThreads.first {
                messageThreadController.createMessage(in: thread, withText: "TestText", sender: "TestSender", completion: {
                    XCTAssertNotEqual(thread.messages, [])
                    XCTAssertEqual(thread.messages.first?.messageText, "TestText")
                    XCTAssertEqual(thread.messages.first?.sender, "TestSender")
                })
            }
        }
        
        
    }
    
    
    
}
