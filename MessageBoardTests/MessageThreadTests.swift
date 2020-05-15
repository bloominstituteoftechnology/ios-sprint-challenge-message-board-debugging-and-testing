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
        let didFinishCreating = expectation(description: "didFinishCreating")
        var successfulCreation = false
        
        messageThreadController.createMessageThread(with: "Message Thread") {
            didFinishCreating.fulfill()
            successfulCreation = true
        }
        
        wait(for: [didFinishCreating], timeout: 5)
        XCTAssertTrue(successfulCreation)
        
        let didFinishMessage = expectation(description: "didFinishMessage")
        var success = false
        let messageThread = messageThreadController.messageThreads[0]
        
        messageThreadController.createMessage(in: messageThread, withText: "Text", sender: "More Text") {
            didFinishMessage.fulfill()
            success = true
        }
        
        wait(for: [didFinishMessage], timeout: 5)
        
        XCTAssertTrue(success)
    }
}
