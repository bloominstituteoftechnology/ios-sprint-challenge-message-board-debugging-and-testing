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
    
    
    func testCreateThread () {
        let title = "John"
        
        let newMessageThread = MessageThread(title: title)
        
        XCTAssertNotNil(newMessageThread)
    }
    
    func testCreateMessage() {
        let sender = "Me"
        let messageText = "Testing"
        
        let newMessage = MessageThread.Message(text: messageText, sender: sender)
        
        XCTAssertNotNil(newMessage)
        
    }
    
    func testFetchingMessages() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.fetchMessageThreads {
            XCTAssert(!messageThreadController.messageThreads.isEmpty)
        }
    }
    
}
