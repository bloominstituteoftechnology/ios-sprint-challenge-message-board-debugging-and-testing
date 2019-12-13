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
    
    // Testing bug 4
    func testFetchMessageThreads() {
        let waitForThreadFetch = expectation(description: "Wait for threads fetched")
        messageThreadController.fetchMessageThreads {
            waitForThreadFetch.fulfill()
        }
        wait(for: [waitForThreadFetch], timeout: 2)
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
}
