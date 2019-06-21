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

    var messageThreadController: MessageThreadController!

    override func setUp() {
        messageThreadController = MessageThreadController()
    }


    func testCreateMessageThread() {



        messageThreadController.createMessageThread(with: "Please Work") {
            let messageThread = self.messageThreadController.messageThreads
            XCTAssertGreaterThan(messageThread.count, 0)
        }
    }

    func testCreatingMessage() {

        messageThreadController.createMessageThread(with: "Please Work") {
            let messageThreads = self.messageThreadController.messageThreads

            guard let messageThread = messageThreads.first else { return }

            self.messageThreadController.createMessage(in: messageThread, withText: "Test Title", sender: "Diante", completion: {
                let message = messageThread.messages
                XCTAssertGreaterThan(message.count, 0)
            })
        }
    }

    func testFetchMessage() {

        messageThreadController.createMessageThread(with: "Please Work") {
            let messageThreads = self.messageThreadController.messageThreads

            guard let messageThread = messageThreads.first else { return }

            self.messageThreadController.createMessage(in: messageThread, withText: "Test Title", sender: "Diante", completion: {
                let message = messageThread.messages
                XCTAssertGreaterThan(message.count, 0)
            })
        }

        messageThreadController.fetchMessageThreads {
            let messageThreads = self.messageThreadController.messageThreads
            XCTAssertGreaterThan(messageThreads.count, 0)
        }

    }
    
    
}
