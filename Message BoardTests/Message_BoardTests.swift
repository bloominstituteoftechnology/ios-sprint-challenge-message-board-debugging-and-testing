//
//  Message_BoardTests.swift
//  Message BoardTests
//
//  Created by Thomas Sabino-Benowitz on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


    import XCTest

    @testable import Message_Board

    class MessageThreadControllerTests: XCTestCase {

        func testCreateThreadIncrementThreadCount() {
            let messageThreadController = MessageThreadController()

            let originalCount = messageThreadController.messageThreads.count

            let didFinish = expectation(description: "didFinish")

            messageThreadController.createMessageThread(with: "THREAD") {
                didFinish.fulfill()
            }
            wait(for: [didFinish], timeout: 5)

            XCTAssertEqual(originalCount + 1, messageThreadController.messageThreads.count)
        }

        func testLoadThreadsCheckCount() {
            let messageThreadController = MessageThreadController()

            XCTAssertGreaterThanOrEqual(0, messageThreadController.messageThreads.count)

            let didFinish = expectation(description: "didFinish")

            messageThreadController.fetchMessageThreads {
                didFinish.fulfill()
            }

            wait(for: [didFinish], timeout: 5)

            XCTAssertEqual(messageThreadController.messageThreads.count, 0)
        }
        
//        func testCreateMessage() {
//            let messageThreadController = MessageThreadController()
//
//            let didFinish = expectation(description: "didFinish")
//
//            let didCreateMessage = expectation(description: "didCreateMessage")
//
//            messageThreadController.fetchMessageThreads {
//                didFinish.fulfill()
//            }
//
//            wait(for: [didFinish], timeout: 5)
//            let originalCount = messageThreadController.messageThreads[0].messages.count
//
//
//            messageThreadController.createMessage(in: messageThreadController.messageThreads[0], withText: "NEW", sender: "Thomas") {
//                didCreateMessage.fulfill()
//            }
//            wait(for: [didCreateMessage], timeout: 5)
//
//            XCTAssertEqual(originalCount + 1, messageThreadController.messageThreads[0].messages.count)
//        }




}
