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
        messageThreadController.createMessageThread(with: "Testing") {
            XCTAssert(messageThreadController.messageThreads.count > 0)
            
        }
        
//        let expectation = self.expectation(description: "Message thread should be created")
//
//        messageThreadController.createMessageThread(with: "TestNewThread") {
//            expectation.fulfill()
//        }
//
//        // Before the test ends, we want to wait a given number of seconds.
//
//        waitForExpectations(timeout: 5, handler: nil)
//
//        XCTAssert(self.messageThreadController.messageThreads.count > 0)
//        XCTAssertEqual(self.messageThreadController.messageThreads.first?.title, "TestNewThread")
        
    }
    
    
    func testCreateNewMessage() {
         let messageThreadController = MessageThreadController()
        messageThreadController.createMessageThread(with: "TestNewMessage") {
            XCTAssert(messageThreadController.messageThreads.count > 0)
            XCTAssertEqual(messageThreadController.messageThreads.first?.title, "TestNewMessage")
        }
    }
    
    
    func testFetchMessageThreads() {
         let messageThreadController = MessageThreadController()
        messageThreadController.fetchMessageThreads {
            XCTAssert(messageThreadController.messageThreads.count > 0)
            XCTAssertEqual(messageThreadController.messageThreads.first?.title, "Fetching Messages")
        }
    }
    
}









