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
    
    let messageThreadController = MessageThreadController()
    
    func testCreateNewThread() {
        
        messageThreadController.createMessageThread(with: "TestNewThread") {
            XCTAssert(self.messageThreadController.messageThreads.count > 0)
            XCTAssertEqual(self.messageThreadController.messageThreads.first?.title, "TestNewThread")
        }
    }
    
    
    func testCreateNewMessage() {
        messageThreadController.createMessageThread(with: "TestNewMessage") {
            XCTAssert(self.messageThreadController.messageThreads.count > 0)
            XCTAssertEqual(self.messageThreadController.messageThreads.first?.title, "TestNewMessage")
        }
    }
    
    
    func testFetchMessageThreads() {
        messageThreadController.fetchMessageThreads {
            XCTAssert(self.messageThreadController.messageThreads.count > 0)
            XCTAssertEqual(self.messageThreadController.messageThreads.first?.title, "Fetching Messages")
        }
    }
    
}









