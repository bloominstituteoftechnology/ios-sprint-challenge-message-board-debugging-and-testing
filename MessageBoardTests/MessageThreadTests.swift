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

    func testCreatingThread() {
        let messageThreadController = MessageThreadController()
        messageThreadController.createLocalMessageThread(with: "New Thread") {
            XCTAssertTrue(messageThreadController.messageThreads.count == 1)
        }
    }

    func testCreatingMessage() {
        let newThread = MessageThread(title: "New Thread")
        let newMessage = MessageThread.Message(text: "Some Text", sender: "Some Sender")
        newThread.messages.append(newMessage)

        XCTAssertTrue(newThread.messages.count == 1)
    }
}
