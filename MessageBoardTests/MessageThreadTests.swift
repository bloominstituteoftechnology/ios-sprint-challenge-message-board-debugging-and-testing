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
    func testNumberOfMessageThreads() {
        let messageThreadController = MessageThreadController()
        
        // New messagethread
        let newMessageThread = MessageThread(title: "Hello")
        messageThreadController.messageThreads.append(newMessageThread)
        
        // New message
        let newMessage = MessageThread.Message(text: "Hello", sender: "Kevin")
        newMessageThread.messages.append(newMessage)
        
        XCTAssertTrue(newMessageThread.messages.count == 1)
    }
}
