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
    
    /// Didn't want to keep creating a new one
    private var messageThreadController: MessageThreadController!
    
    /// Do this every time a test runs
    override func setUp() {
        messageThreadController = MessageThreadController()
    }
    
    /// Tests to see if MessageThreads can be created
    func testCreateThread() {
        messageThreadController?.createMessageThread(with: "Goober", completion: {
            let allThreads = self.messageThreadController?.messageThreads
            XCTAssertGreaterThan(allThreads!.count, 0, "testCreateThread failed. Count is 0")
        })
    }
    
    /// Tests to see if Messages can be created
    func testCreatMessage() {
        messageThreadController?.createMessageThread(with: "Goober", completion: {
            let allThreads = self.messageThreadController?.messageThreads
            XCTAssertGreaterThan(allThreads!.count, 0, "testCreateThread failed. Count is 0")
        })
    }
}
