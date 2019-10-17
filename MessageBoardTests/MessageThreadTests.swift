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
    
    func testCreateMessageThread() {
    
        let title = "New Thread"
        let newThreadName = MessageThread(title: title)
        
        XCTAssert(newThreadName.title == "New Thread")
        
    }
    
    func testCreateMessages() {
        let message = "A new message"
        let sender = "Tom"
        let newMessage = MessageThread.Message(text: message, sender: sender)
        
        XCTAssert(newMessage.messageText == "A new message")
        XCTAssert(newMessage.sender == "Tom")
        
        
    }
    
}
