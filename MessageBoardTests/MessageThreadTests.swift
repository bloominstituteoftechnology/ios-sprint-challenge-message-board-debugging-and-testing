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
    
    private var messageThreadController: MessageThreadController = {
        MessageThreadController()
    }()
    
    func testCreatingThreadWithServer() {
        let didFinish = expectation(description: "didFinish")
        var success = false
        
        messageThreadController.createMessageThread(with: "New Thread") {
            didFinish.fulfill()
            success = true
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertTrue(success)
    }
    
    func testSyncingThreadsWithServer() {
        let didFinish = expectation(description: "didFinish")
        var success = false
        
        messageThreadController.fetchMessageThreads {
            didFinish.fulfill()
            success = true
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertTrue(success)
    }
    
    func testCreatingMessageWithServer() {
        let didFinish = expectation(description: "didFinish")
        let messageThread = MessageThread(title: "MessageThread")
        var success = false
        messageThreadController.messageThreads.append(messageThread)
        
        messageThreadController.createMessage(in: messageThread, withText: "Text", sender: "More Text") {
            didFinish.fulfill()
            success = true
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertTrue(success)
    }
}
