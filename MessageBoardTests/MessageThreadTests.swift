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
    
    func testDecoding() {
        let url = Bundle.main.url(forResource: "MockMessages", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let messages = try! JSONDecoder().decode([String: MessageThread].self, from: data).map { $0.value }
        XCTAssertNoThrow(messages)
    }
    
    func testCreateThread() {
        let messageThreadController = MessageThreadController()
        let expectation = XCTestExpectation(description: "Thread Created")
        
        messageThreadController.createMessageThread(with: "Test Thread") {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(messageThreadController.messageThreads.count, 1)
        XCTAssertFalse(messageThreadController.messageThreads.count == 2)
    }
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        let threadExpectation = XCTestExpectation(description: "Test Thread")
        
        messageThreadController.createMessageThread(with: "Test Thread") {
            threadExpectation.fulfill()
        }
        
        wait(for: [threadExpectation], timeout: 5)
        XCTAssertEqual(messageThreadController.messageThreads.count, 1)
        
        let messageExpectation = XCTestExpectation(description: "Test Message")
        guard let thread = messageThreadController.messageThreads.first else { return }
        let message = thread.messages.first
        
        XCTAssertNil(message)
        messageThreadController.createMessage(in: thread, withText: "Testing testing...", sender: "Tobi") {
            messageExpectation.fulfill()
        }
        
        wait(for: [messageExpectation], timeout: 10)
        XCTAssertEqual(thread.messages.count, 1)
    }
}
