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
    
    var messageThreadController : MessageThreadController!
    
    override func setUp() {
        messageThreadController = MessageThreadController()
        messageThreadController.messageThreads = []
    }
    
    
    func testCreatingAThread() {
        let title = "Unit Test"
        messageThreadController.createMessageThread(with: title) {
            XCTAssertEqual(title, self.messageThreadController.messageThreads[0].title)
        }
    }
    
    
    func testFetchingThreads() {
        messageThreadController.fetchMessageThreads {
            XCTAssertTrue(self.messageThreadController.messageThreads.count > 0)
        }
    }
    
}
