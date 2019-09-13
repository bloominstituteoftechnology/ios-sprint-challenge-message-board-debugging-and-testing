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
        
        XCTAssertEqual(0, messageThreadController.messageThreads.count)
        
        let didFinish = expectation(description: "didFinish")
        
        messageThreadController.createMessageThread(with: "UItest") {
            didFinish.fulfill()
        }
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertEqual(1, messageThreadController.messageThreads.count)
    }
    
    func testLoadThreadCorrectCount() {
        let messageThreadController = MessageThreadController()
        
        let didFinish = expectation(description: "didFinish")
        
        messageThreadController.fetchMessageThreads {
            didFinish.fulfill()
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertEqual(1, messageThreadController.messageThreads.count)
    }
    
    func testCreateMessage() {
        
    }
    
    
    
    
    
}
