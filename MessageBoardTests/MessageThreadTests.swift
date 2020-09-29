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
    
    var messageThreadController = MessageThreadController()
    
    func testCreatingNewThread() throws {
        let expectation = XCTestExpectation(description: "NewThread")
        messageThreadController.createMessageThread(with: "Test") {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
        
        XCTAssertEqual(messageThreadController.messageThreads.last!.title, "Test")
    }
    
    func testFetchingMessageThreads() throws {
       let expectation = XCTestExpectation(description: "FetchThread")
        messageThreadController.fetchMessageThreads {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
        
        XCTAssertGreaterThan(messageThreadController.messageThreads.count, 3)
    }
}
