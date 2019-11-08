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
    
    func testAddThread() {
        var count = 0
        messageThreadController.fetchMessageThreads {
            count = self.messageThreadController.messageThreads.count
        }
        messageThreadController.createMessageThread(with: "Test") {
            XCTAssertTrue(self.messageThreadController.messageThreads.count == count + 1)
        }
    }
    
    func testAddMessageToThread() {
        var count = 0
        messageThreadController.fetchMessageThreads {
            self.messageThreadController.createMessageThread(with: "Test") {
                count = self.messageThreadController.messageThreads[0].messages.count
                self.messageThreadController.createMessage(in: self.messageThreadController.messageThreads[0], withText: "Test Message", sender: "Me of course") {
                    XCTAssertTrue(self.messageThreadController.messageThreads[0].messages.count == count + 1)
                }
            }
        }
    }
}
