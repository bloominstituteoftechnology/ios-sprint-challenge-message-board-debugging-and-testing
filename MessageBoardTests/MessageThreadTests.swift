//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase
{
    var messageThreadController = MessageThreadController()
    
    override func setUp()
    {
        messageThreadController = MessageThreadController()
    }
    
    func testCreateThread()
    {
        let expectations = expectation(description: "Create")
        XCTAssertEqual(messageThreadController.messageThreads, [])
        
        messageThreadController.createMessageThread(with: "Testing")
        {
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
            expectations.fulfill()
        }
        waitForExpectations(timeout: 50, handler: nil)
    }
    
    func testFetchThread()
    {
        let expectations = expectation(description: "Fetch")
        XCTAssertEqual(messageThreadController.messageThreads, [])
        messageThreadController.fetchMessageThreads
        {
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
            expectations.fulfill()
        }
        waitForExpectations(timeout: 50, handler: nil)
    }
    
    func testCreateMessage() {
        let expectation1 = expectation(description: "Fetch")
        let expectation2 = expectation(description: "CreateMessage")
        var fetchedThreads: [MessageThread] = []
        XCTAssertEqual(messageThreadController.messageThreads, [])
        
        messageThreadController.fetchMessageThreads
        {
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
            fetchedThreads = self.messageThreadController.messageThreads
            expectation1.fulfill()
            
            XCTAssertNotNil(fetchedThreads.first)
            guard let messageThread = fetchedThreads.first else { return }
            let messages = messageThread.messages
            
            self.messageThreadController.createMessage(in: messageThread, withText: "Everything is wonderful.", sender: "Carolyn")
            {
                XCTAssertNotEqual(messageThread.messages, messages)
                expectation2.fulfill()
            }
        }
        waitForExpectations(timeout: 50, handler: nil)
    }
    
}
