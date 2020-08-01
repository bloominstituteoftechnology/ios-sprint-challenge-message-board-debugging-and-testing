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

    func testCreateMessage() {
        messageThreadController.createLocalMessageThread(with: "Hello") {
            return
        }
        XCTAssertEqual(1, self.messageThreadController.messageThreads.count)
    }
}
