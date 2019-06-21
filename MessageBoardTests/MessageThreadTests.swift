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
    
    var messageThreadController: MessageThreadController?
    
    override func setUp() {
        messageThreadController = MessageThreadController()
    }
    
    func testCreateMessage() {
        messageThreadController?.createMessageThread(with: "Test Message") {
            guard let messageThreads = self.messageThreadController?.messageThreads else { return }
            XCTAssert(messageThreads.count > 0, "Test message Created.")
        }
    }
    
    func testCreateMessageFromSelectedMessage() {
        messageThreadController?.createMessageThread(with: "Unit Test Thread") {
            let messageThreads = self.messageThreadController?.messageThreads
            guard let message = messageThreads?.first else { return }
            
            self.messageThreadController?.createMessage(in: message, withText: "Test Inside create message", sender: "Hayden", completion: {
                let messages = message.messages
                XCTAssertTrue(messages.count > 0)
            })
        }
    }
}
