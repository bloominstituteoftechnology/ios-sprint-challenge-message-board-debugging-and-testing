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
    
    let createMessage = MessageThread.Message(text: "New Message", sender: "Me", timestamp: Date())
    let createThread = MessageThread(title: "Test", messages: [MessageThread.Message(text: "New Message", sender: "Me", timestamp: Date())], identifier: "120119")
    
    
    func testFetchMessageThreads() {
        let fetchMessageCheck = expectation(description: "Grabbed the data")
        messageThreadController.fetchMessageThreads {
            fetchMessageCheck.fulfill()
        }
        wait(for: [fetchMessageCheck], timeout: 10)
        XCTAssertTrue(true)
    }
    
    
    func testCreateAMessage() {
        XCTAssertEqual("New Message", createMessage.messageText)
    }
    
    func testCreatingAThread() {
        XCTAssertEqual("New Message", createThread.messages[0].messageText)
    }
}
