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
    
    private var messageThreadController: MessageThreadController{
        MessageThreadController()
    }
    
    func testCreatingThreadWithServer() {
        let didFinish = expectation(description: "didFinish")
        
        messageThreadController.createMessageThread(with: "New Thread") {
            didFinish.fulfill()
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssert(true)
    }
    
    func testSyncingThreadsWithServer() {
        let didFinish = expectation(description: "didFinish")
        
        messageThreadController.fetchMessageThreads {
            didFinish.fulfill()
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssert(true)
    }
}
