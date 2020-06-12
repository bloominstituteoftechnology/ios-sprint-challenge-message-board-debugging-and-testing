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
    
    func testCreateThread() {
        let messageThreadController = MessageThreadController()
        messageThreadController.createLocalMessageThread(with: "Test") {
            XCTAssertTrue(messageThreadController.messageThreads.contains(MessageThread(title: "Test")))
        }
    }
    
    func testCreateReplyMessage() {
        let testThread = MessageThread(title: "Test")
        let testReply = MessageThread.Message(text: "I disagree.", sender: "Disagreeable123")
        testThread.messages.append(testReply)
        XCTAssertTrue(testThread.messages.contains(testReply))
    }
}
