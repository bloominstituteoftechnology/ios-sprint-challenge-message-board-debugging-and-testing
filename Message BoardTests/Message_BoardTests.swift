//
//  Message_BoardTests.swift
//  Message BoardTests
//
//  Created by Thomas Sabino-Benowitz on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board


class MessageBoardTests: XCTestCase {
    
    let messageThreadController = MessageThreadController()
    
    //MARK: - Tests
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
                
                self.messageThreadController.createMessage(in: self.messageThreadController.messageThreads[0], withText: "Test", sender: "Tester") {
                    XCTAssertTrue(self.messageThreadController.messageThreads[0].messages.count == count + 1)
                }
            }
        }
    }
    
}


