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

    // 1. Bug. Not creates a thread
    
    func testCreateLocalThread() {
        messageThreadController.createLocalMessageThread(with: "Test Local Thread") {
        }
        XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
    }
    
    // 2. Bug. Not fetching threads
    
    func testLocalFetch() {
        messageThreadController.fetchLocalMessageThreads {
        }
        XCTAssertFalse(messageThreadController.messageThreads.isEmpty)
    }
}
