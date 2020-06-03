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
    
    // MARK: Bug 1 test .resume() missing
    
    // This test fails without .resume() and passes with .resume()
    func testCreateNewThread() {
        let messageThreadController = MessageThreadController()
        
        let expectedResult = XCTestExpectation(description: "New message thread should have been created")
        let initialMessageThreadCount = messageThreadController.messageThreads.count
        
        messageThreadController.createMessageThread(with: "This is a test thread") {
            expectedResult.fulfill()
        }
        
        wait(for: [expectedResult], timeout: 6)
        XCTAssertEqual(messageThreadController.messageThreads.count,
                       initialMessageThreadCount + 1)
        
    }
    
    // MARK: Bug 3 test
    func testDecodingMessages() {
        let messageThreadController = MessageThreadController()
        
        let expectedResult = XCTestExpectation(description: "Decoding messages failed")
        messageThreadController.fetchLocalMessageThreads {
            expectedResult.fulfill()
        }
        
        wait(for: [expectedResult], timeout: 10)
        let first = messageThreadController.messageThreads.first
        XCTAssertGreaterThan(first?.messages.count ?? 0,0)
    }
}
