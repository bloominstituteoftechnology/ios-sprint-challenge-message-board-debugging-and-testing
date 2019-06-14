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
		Message_Board.unitTestingMockData = true
	}
    
	func testTestDecodingThread() {
		let semaphore = DispatchSemaphore(value: 0)
		let controller = MessageThreadController()
		controller.fetchMessageThreads {
			semaphore.signal()
		}
		semaphore.wait()

		let messageThreads = controller.messageThreads.sorted { $0.title < $1.title }

		XCTAssert(messageThreads.count == 2)
		XCTAssert(messageThreads.first?.title == "A New Thread")
	}

	func testCreateMessageThread() {
		let controller = MessageThreadController()
		let startCount = controller.messageThreads.count

		controller.createMessageThread(with: "Test Thread") {}
		XCTAssertTrue(controller.messageThreads.count == startCount + 1)
		XCTAssertTrue(controller.messageThreads.last?.title == "Test Thread")
	}

	func testThreadsEquatable() {
		let aMessage = MessageThread.Message(text: "Test Message", sender: "Test Sender")
		let id = UUID().uuidString
		let messageThread = MessageThread(title: "Test Thread", messages: [aMessage], identifier: id)
		let copyThread = MessageThread(title: "Test Thread", messages: [aMessage], identifier: id)
		let differentThread = MessageThread(title: "Not the same", messages: [aMessage], identifier: UUID().uuidString)

		XCTAssertEqual(messageThread, copyThread)
		XCTAssertEqual(messageThread, messageThread)
		XCTAssertNotEqual(messageThread, differentThread)
	}

	func testMessageCreate() {
		let controller = MessageThreadController()
		controller.createMessageThread(with: "Test Thread", completion: {})
		let thread = controller.messageThreads.first!

		XCTAssertTrue(thread.messages.count == 0)
		controller.createMessage(in: thread, withText: "Test Message", sender: "It's a me a Mario", completion: {})
		XCTAssertTrue(thread.messages.count == 1)

		XCTAssertTrue(thread.messages.first?.text == "Test Message")
		XCTAssertTrue(thread.messages.first?.sender == "It's a me a Mario")
	}
}
