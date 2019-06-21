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

    override func setUp() {
        messageThreadController = MessageThreadController()
    }

 


    func testCreateMessageThread() {
        let expectation = self.expectation(description: "Creating")
        messageThreadController.createMessageThread(with: "Test Thread") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil) // This waits a little bit for the createMessageThread func to finish

        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
        XCTAssertFalse(messageThreadController.messageThreads.count == 0)
    }

    func testCreateMessageWithinMessageThread() {
        var expectation = self.expectation(description: "Creating Thread")
        messageThreadController.createMessageThread(with: "Test Thread") {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
        XCTAssertFalse(messageThreadController.messageThreads.count == 0)
        expectation = self.expectation(description: "Creating Thread")
        guard let thread = messageThreadController.messageThreads.first else { return }
        self.messageThreadController.createMessage(in: thread, withText: "Test Message", sender: "Test Name", completion: {
            expectation.fulfill()
        })

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(thread.messages.count > 0)
        XCTAssertFalse(thread.messages.count == 0)
    }
    func testFetchMessageThread() {
        messageThreadController.createMessageThread(with: "Test Thread") {
        }

        usleep(600000)
        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
        XCTAssertFalse(messageThreadController.messageThreads.count == 0)
        messageThreadController.fetchMessageThreads {
        }

        usleep(500000)
        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
        XCTAssertFalse(messageThreadController.messageThreads.count == 0)
}
    var messageThreadController: MessageThreadController!
}
