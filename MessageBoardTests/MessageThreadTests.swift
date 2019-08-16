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
    
    func testCreatingMessageThread(){
        let title = "Title"
        let createMessage = MessageThread(title: title)
        XCTAssertNotNil(createMessage)
    }
    
    func testCreatingMessage(){
        let text = "text"
        let sender = "sender"
        let createdMessage = MessageThread.Message(text: text, sender: sender)
        XCTAssertNotNil(createdMessage)
    }
    
    func testFetchingMessageThread() {
        let messageThreadController = MessageThreadController()
        messageThreadController.fetchMessageThreads {
            XCTAssert(!messageThreadController.messageThreads.isEmpty)
        }
    }
    
}
