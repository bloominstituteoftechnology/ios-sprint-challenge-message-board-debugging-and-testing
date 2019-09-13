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

	var app: XCUIApplication!
    let threadTableView = MessageThreadsTableViewController()

	let myMessageThread = MessageThread(title: "Test Message Thread", messages: [MessageThread.Message(text: "Some stuff", sender: "Marlon")], identifier: UUID().uuidString)

	func testCreateMessageThread() {
		let threadController = MessageThreadController()
		XCTAssertTrue(threadController.messageThreads.count == 0)
		let didFinish = expectation(description: "didFinish")
		threadController.createLocalMessageThread(with: "Testing With Unit Tests") {
			didFinish.fulfill()
		}
		wait(for: [didFinish], timeout: 5)
		XCTAssertTrue(threadController.messageThreads.count > 0)
	}

	func testFetchingMessageThreads() {
		let threadController = MessageThreadController()
		XCTAssertTrue(threadController.messageThreads.count == 0)
		let didFinish = expectation(description: "Finished fetching threads")
		var isFinished: Bool = false
		threadController.fetchLocalMessageThreads {
			didFinish.fulfill()
			isFinished = true
		}
		wait(for: [didFinish], timeout: 5)
		XCTAssertTrue(isFinished == true)
	}

}
