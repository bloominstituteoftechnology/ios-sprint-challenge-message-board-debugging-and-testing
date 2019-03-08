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

    var messageThreadController: MessageThreadController!
    
    override func setUp() {
        messageThreadController = MessageThreadController()
    }
    
    
    func testCreateMessageThread() {
        messageThreadController.createMessageThread(with: "Unit Test Thread") {
            let messageThreads = self.messageThreadController.messageThreads
            XCTAssertTrue(messageThreads.count > 0)
        }
    }
    
    func testCreateMessageWithinMessageThread() {
        messageThreadController.createMessageThread(with: "Unit Test Thread") {
            let messageThreads = self.messageThreadController.messageThreads
            
            guard let firstMessageThread = messageThreads.first else { return }
            
            self.messageThreadController.createMessage(in: firstMessageThread, withText: "Unit Test Message", sender: "Unit Test Name", completion: {
                let messages = firstMessageThread.messages
                XCTAssertTrue(messages.count > 0)
            })
        }
    }
    func testFetchMessageThread() {
        messageThreadController.createMessageThread(with: "Test Thread") {
        
            let messageThreads = self.messageThreadController.messageThreads
            guard let firstMessageThread = messageThreads.first else { return }
            
            self.messageThreadController.createMessage(in: firstMessageThread, withText: "Unit Test Message", sender: "Unit Test Name", completion: {
            let messages = firstMessageThread.messages
            XCTAssertTrue(messages.count > 0)
            })
        }
        
            messageThreadController.fetchMessageThreads {
                let messageThreads = self.messageThreadController.messageThreads
            XCTAssertTrue(messageThreads.count > 0)
        }
    }

}
