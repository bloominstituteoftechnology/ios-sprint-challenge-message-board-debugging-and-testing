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
    func testAddingMessageToMessageThreads() {
        let messageThreadController = MessageThreadController()
        let messageThreadCount = messageThreadController.messageThreads.count
        
        messageThreadController.createMessageThread(with: "Test Message") {
            NSLog("Message created successfully")
        }
        
        XCTAssertNotEqual(messageThreadCount, messageThreadController.messageThreads.count)
    }
}
