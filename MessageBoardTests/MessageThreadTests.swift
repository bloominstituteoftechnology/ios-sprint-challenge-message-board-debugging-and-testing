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

    func testCreatingThread() {
        messageThreadController.createLocalMessageThread(with: "New Thread") {
            XCTAssertTrue(self.messageThreadController.messageThreads.count == 1)
        }
    }

    func testCreatingMessage() {
        let newThread = MessageThread(title: "New Thread")
        let newMessage = MessageThread.Message(text: "Some Text", sender: "Some Sender")
        newThread.messages.append(newMessage)

        XCTAssertTrue(newThread.messages.count == 1)
    }
}
