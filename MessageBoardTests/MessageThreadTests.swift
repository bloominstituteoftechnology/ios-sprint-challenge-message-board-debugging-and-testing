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
    
    override func setUp() {
        messageThreadController = MessageThreadController()
    }
    
    
    // MARK: - MessageThread
    
    func testCreatingMessageThread() {
        let title = "Hello"
        let messageThread = MessageThread(title: title)
        XCTAssertEqual(messageThread.title, title)
        XCTAssertEqual(messageThread.messages, [])
        XCTAssertNotNil(messageThread.identifier)
    }
    
    func testCreatingMessage() {
        let text = "Bonjour"
        let sender = "Samantha"
        let message = MessageThread.Message(text: text, sender: sender)
        XCTAssertEqual(message.messageText, text)
        XCTAssertEqual(message.sender, sender)
    }
    
    func testCreatingMessageThreadWithMessages() {
        let message1 = MessageThread.Message(text: "Message 1", sender: "Samantha")
        let message2 = MessageThread.Message(text: "Message 2", sender: "Samantha")
        let messageThread = MessageThread(title: "Message Thread", messages: [message1, message2])
        XCTAssertEqual(messageThread.messages, [message1, message2])
    }
    
    
    // MARK: - MessageThreadController
    
    // only succeeds if json has data in it (is not empty)
    func testFetchMessageThreadFunction() {
        let exp = expectation(description: "Fetch")
        XCTAssertEqual(messageThreadController.messageThreads, [])
        messageThreadController.fetchMessageThreads {
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
            exp.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testCreateMessageThreadFunction() {
        let exp1 = expectation(description: "Fetch")
        let exp2 = expectation(description: "CreateThread")
        
        var messageThreadsAfterFetch: [MessageThread] = []
        
        // Makes sure messageThreads are empty before fetching
        XCTAssertEqual(messageThreadController.messageThreads, [])
        
        // Fetches messages/threads
        messageThreadController.fetchMessageThreads {
            // Makes sure fetch returned data
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
            // stores messageThreads after fetching them
            messageThreadsAfterFetch = self.messageThreadController.messageThreads
            exp1.fulfill()
            
            // Creates thread
            self.messageThreadController.createMessageThread(with: "Testing") {
                // makes sure stored message threads aren't empty
                XCTAssertNotEqual(messageThreadsAfterFetch, [])
                XCTAssertNotEqual(self.messageThreadController.messageThreads, messageThreadsAfterFetch)
                exp2.fulfill()
            }
        }
        // might have to change timeout int depending on internet speed?
        waitForExpectations(timeout: 60, handler: nil)
    }
    
    func testCreateMessageFunction() {
        let exp1 = expectation(description: "Fetch1")
        let exp2 = expectation(description: "CreateMessage")
        let exp3 = expectation(description: "Fetch2")
        
        var messageThreadsAfterFetch: [MessageThread] = []
        
        // Makes sure messageThreads are empty before fetching
        XCTAssertEqual(messageThreadController.messageThreads, [])
        
        // Fetches messages/threads
        messageThreadController.fetchMessageThreads {
            // Makes sure fetch returned data
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
            // stores messageThreads after fetching them
            messageThreadsAfterFetch = self.messageThreadController.messageThreads
            exp1.fulfill()
            
            // Makes sure messageThreadsAfterFetch isn't nil
            XCTAssertNotNil(messageThreadsAfterFetch.first)
            // Stores messages in thread
            guard let messageThread = messageThreadsAfterFetch.first else { return }
            let messages = messageThread.messages
            
            
            // Creates message in first thread
            self.messageThreadController.createMessage(in: messageThread, withText: "This is a unit test message", sender: "Sam") {
                // Makes sure stored messages aren't equal to the new array of messages after creating one
                XCTAssertNotEqual(messageThread.messages, messages)
                exp2.fulfill()
                
                // Makes sure it doesn't break the json
                let newMessageThreadController = MessageThreadController()
                XCTAssertEqual(newMessageThreadController.messageThreads, [])
                newMessageThreadController.fetchMessageThreads {
                    XCTAssertNotEqual(newMessageThreadController.messageThreads, [])
                    exp3.fulfill()
                }
            }
        }
        
        // might have to change timeout int depending on internet speed?
        waitForExpectations(timeout: 60, handler: nil)
    }
}
