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

    func testSendMessage() {
        let messageThreadMessage = MessageThread.Message(text: "Hello there.", sender: "Josh", timestamp: Date())
        let messageTread = MessageThread(title: "Hi There", messages: [messageThreadMessage], identifier: "FCAB7137-1D84-40F5-94A7-8931032DAF87")

        messageThreadController.createMessage(in: messageTread, withText: "Hello there.", sender: "Josh") {
            return
        }


    }
}
