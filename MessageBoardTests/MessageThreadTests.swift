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
    
    let messageThreadController = MessageThreadController()
    
    func testCreateThread() {
        messageThreadController.createMessageThread(with: "Testing creating a thread") {
            XCTAssertEqual(self.messageThreadController.messageThreads.first?.title, "Testing creating a thread")
        }
    }
    
    func testCreateMessage() {
        messageThreadController.createMessageThread(with: "Testing creating a message") {
            XCTAssertEqual(self.messageThreadController.messageThreads.first?.title, "Testing creating a message")
            self.messageThreadController.createMessage(in: self.messageThreadController.messageThreads.first!, withText: "Testing", sender: "Tester", completion: {
                XCTAssertEqual(self.messageThreadController.messageThreads.first?.messages.first?.messageText, "Testing")
                XCTAssertEqual(self.messageThreadController.messageThreads.first?.messages.first?.sender, "Tester")
            })
        }
    }
    
    func testFetchThreads() {
        messageThreadController.fetchMessageThreads {
            XCTAssert(self.messageThreadController.messageThreads != [])
        }
    }
    
}
