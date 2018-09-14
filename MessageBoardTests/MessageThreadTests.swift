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
    
//    var messageThreadController = MessageThreadController()
    
    func testCreateMessageThread() {
        let expectation = XCTestExpectation(description: "Create Message Thread on Server")
        
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "Test") {
            // make sure there is at least one message in there now
            XCTAssertNotEqual(messageThreadController.messageThreads.count, 0) // was never called?
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testServerFetch() {
        let expectation = XCTestExpectation(description: "Fetch Message Thread from Server")
        
        let messageThreadController = MessageThreadController()
        
        messageThreadController.fetchMessageThreads {
            // make sure there is at least one message in there now
            XCTAssertNotEqual(messageThreadController.messageThreads.count, 0) // was never called?
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
