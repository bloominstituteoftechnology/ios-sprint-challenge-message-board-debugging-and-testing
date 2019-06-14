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
		Message_Board.unitTestingMockData = false
	}

	// MARK: - Net

	func waitForFetchThreads(on controller: MessageThreadController) {
		precondition(Message_Board.isUITesting == false, "Turn off UITesting flag")
		let semaphore = DispatchSemaphore(value: 0)
		controller.fetchMessageThreads {
			semaphore.signal()
		}
		semaphore.wait()
	}

	func testCreateMessageThread() {
		let controller = MessageThreadController()

		waitForFetchThreads(on: controller)

		let startCount = controller.messageThreads.count

		let semaphore = DispatchSemaphore(value: 0)
		controller.createMessageThread(with: "Test Thread") {
			print("created message thread")
			semaphore.signal()
		}
		semaphore.wait()

		waitForFetchThreads(on: controller)
		XCTAssertTrue(controller.messageThreads.count > startCount, "count: \(controller.messageThreads.count) startCount: \(startCount)")
	}

	/** if this fails *twice* in a row, then it's an issue (this will fail if there
	are no threads on the server. other tests create threads, so if you run tests
	again, it should pass if it's working) */
	func testFetchThreads() {
		let controller = MessageThreadController()
		let startCount = controller.messageThreads.count

		waitForFetchThreads(on: controller)
		XCTAssertTrue(controller.messageThreads.count > startCount)
	}

	func testCreateMessage() {
		let controller = MessageThreadController()
		waitForFetchThreads(on: controller)

		guard let thread = controller.messageThreads.last else { XCTFail("No message threads - test again"); return }
		let startCount = thread.messages.count
		let semaphore = DispatchSemaphore(value: 0)
		controller.createMessage(in: thread, withText: "Unit Test Message", sender: "Xcode") {
			semaphore.signal()
		}
		semaphore.wait()

		XCTAssertTrue(thread.messages.count > startCount)
		waitForFetchThreads(on: controller)
		XCTAssertTrue(thread.messages.count > startCount)
		XCTAssertTrue(thread.messages.last?.text == "Unit Test Message")
	}


	// MARK: - NoNet

	func testCreateMessageThreadNoNet() {
		Message_Board.unitTestingMockData = true

		let controller = MessageThreadController()
		let startCount = controller.messageThreads.count

		controller.createMessageThread(with: "Test Thread") {}
		XCTAssertTrue(controller.messageThreads.count == startCount + 1)
		XCTAssertTrue(controller.messageThreads.last?.title == "Test Thread")
	}

	func testMessageCreateNoNet() {
		Message_Board.unitTestingMockData = true

		let controller = MessageThreadController()
		controller.createMessageThread(with: "Test Thread", completion: {})
		let thread = controller.messageThreads.first!

		XCTAssertTrue(thread.messages.count == 0)
		controller.createMessage(in: thread, withText: "Test Message", sender: "It's a me a Mario", completion: {})
		XCTAssertTrue(thread.messages.count == 1)

		XCTAssertTrue(thread.messages.first?.text == "Test Message")
		XCTAssertTrue(thread.messages.first?.sender == "It's a me a Mario")
	}

	func testTestDecodingThread() {
		Message_Board.unitTestingMockData = true

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
}
