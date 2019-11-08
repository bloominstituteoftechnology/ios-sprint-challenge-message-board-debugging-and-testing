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
    
    func testFetchThreads() {
        
        XCTAssertEqual(messageThreadController.messageThreads, [])
        
        let promise = expectation(description: "Data fetched")
        
        messageThreadController.fetchMessageThreads {
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 5)
    }
    
    func testMakeNewThread() {
                
        let promise = expectation(description: "Thread created")
        
        messageThreadController.createMessageThread(with: "Test") {
            XCTAssertNotNil(self.messageThreadController.messageThreads.first(where: { $0.title == "Test" }) )
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 5)
    }
    
    func testSendMessage() {
        let promise = expectation(description: "Message Sent")
        
        messageThreadController.fetchMessageThreads {
            
            guard let testThread = self.messageThreadController.messageThreads.first(where: { $0.title == "Test" }) else {
                XCTFail("Could not find test thread. Run testMakeNewThread() first.")
                return
            }
            self.messageThreadController.createMessage(in: testThread, withText: "Test message", sender: "Unit Test") {
                guard let testThread = self.messageThreadController.messageThreads.first(where: { $0.title == "Test" }) else {
                    XCTFail()
                    return
                }
                XCTAssertNotNil(testThread.messages.contains(where: { $0.sender == "Unit Test" }))
                promise.fulfill()
            }
            
        }
        
        
        wait(for: [promise], timeout: 5)
    }
    
}
