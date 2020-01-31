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
    
    var messageThreads: [MessageThread]!
    var messageThreadController: MessageThreadController!
    
    
    override func setUp() {
        messageThreads = []
        messageThreadController = MessageThreadController()
    }

    func testCreateThread() {
        let threadTitle = "Test"
        messageThreadController.createMessageThread(with: threadTitle) {
            XCTAssertFalse(self.messageThreadController.messageThreads.isEmpty)
            XCTAssertEqual(self.messageThreadController.messageThreads[0].title, threadTitle)
        }
    }
    
    func testThreadDecodingThreads() {
        messageThreadController.fetchMessageThreads {
            XCTAssertFalse(self.messageThreadController.messageThreads.isEmpty)
        }
    }
    
}
