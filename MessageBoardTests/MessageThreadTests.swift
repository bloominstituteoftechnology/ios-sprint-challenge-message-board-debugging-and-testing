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

    // Creates a new thread and tests if the messageThread count has increased
    func testCreateMessageThread() {
        let expectation = self.expectation(description: "Creating")
        messageThreadController.createMessageThread(with: "Test Thread") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil) // This waits a little bit for the createMessageThread func to finish

        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
        XCTAssertFalse(messageThreadController.messageThreads.count == 0)
    }

    //Creates a new thread, then creates a new message and tests if the message count on that thread has increased
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

    // Fetches messageThreads from server and checks to see if the messageThread count increased.  ONLY PASSES IF THERES A MESSAGE ON THE SERVER
    func testFetchMessageThread() {
        let expectation = self.expectation(description: "Fetching from server")
        messageThreadController.fetchMessageThreads {
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(messageThreadController.messageThreads.count > 0, "Maybe no messageThread on server")
        XCTAssertFalse(messageThreadController.messageThreads.count == 0, "Thread count is equal to 0")
}
    var messageThreadController: MessageThreadController!
}
