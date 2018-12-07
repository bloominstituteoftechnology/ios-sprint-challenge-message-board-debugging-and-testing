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
    
    
    // New message thread test
    func testCreateNewMessageThread() {
        
        let messageThreadController = MessageThreadController()
        
        let threadTitle = "New thread"
        
        messageThreadController.createMessageThread(with: threadTitle) {
            
            // Assertions: thread array not empty, thread title match, empty messages array
            XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
            XCTAssertEqual(messageThreadController.messageThreads.last?.title, threadTitle)
            XCTAssertEqual(messageThreadController.messageThreads.last?.messages, [])
        }
    }
    
    
    // New message test
    func testCreateNewMessage() {
        
        let messageThreadController = MessageThreadController()

        // Mock test data
        let threadTitle = "New thread"
        let msgText = "This is a new message"
        let sender = "Jason Modisett"
        
        
        // Create a new thread
        messageThreadController.createMessageThread(with: threadTitle) {
            
            // Assertions: thread array not empty, thread title match, empty messages array
            XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
            XCTAssertEqual(messageThreadController.messageThreads.last?.title, threadTitle)
            XCTAssertEqual(messageThreadController.messageThreads.last?.messages, [])
            
            // Create a new message in the new message thread
            if let thread = messageThreadController.messageThreads.first {
                
                messageThreadController.createMessage(in: thread, withText: msgText, sender: sender, orUpdateWithMessage: nil, completion: {
                    
                    // Assertions: verifying data and message identifer
                    XCTAssertEqual(thread.messages.first?.messageText, msgText)
                    XCTAssertEqual(thread.messages.first?.sender, sender)
                    XCTAssertEqual(thread.messages.first?.identifier, thread.identifier)
                })
            }
        }
    }
    
}
