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
    
    
}
