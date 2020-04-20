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

    
    func testMessageSending() {
        let threadController = MessageThreadController()
        let newThread = MessageThread(title: "New Thread")
        threadController.messageThreads.append(newThread)
        
        XCTAssertTrue(newThread.messages.count == 0)
        
        let newMessage = MessageThread.Message(text: "4, 8, 15, 16, 23, 42", sender: "Desmond")
        newThread.messages.append(newMessage)
        
        XCTAssertTrue(newThread.messages.count == 1)
    }
    
    func testCreatingThread() {

        let messageThreadController = MessageThreadController()
        let newThread = MessageThread(title: "New Thread")

        messageThreadController.messageThreads.append(newThread)
        XCTAssertTrue(messageThreadController.messageThreads.count == 1)
    }

    
    
    
    
}
