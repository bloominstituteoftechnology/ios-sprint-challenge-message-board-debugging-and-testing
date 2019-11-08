//
//  MessageThreadControllerTests.swift
//  MessageBoardTests
//
//  Created by Percy Ngan on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadControllerTests: XCTestCase {

   func testCreateThreadIncreaseThreadCount() {
	   let messageThreadController = MessageThreadController()

	   XCTAssertEqual(0, messageThreadController.messageThreads.count)

	   let didFinish = expectation(description: "didFinish")

	   messageThreadController.createMessageThread(with: "UItest") {
		   didFinish.fulfill()
	   }
	   wait(for: [didFinish], timeout: 5)

	   XCTAssertEqual(1, messageThreadController.messageThreads.count)
   }

   func testLoadThreadCorrectCount() {
	   let messageThreadController = MessageThreadController()

	   let didFinish = expectation(description: "didFinish")

	   messageThreadController.fetchMessageThreads {
		   didFinish.fulfill()
	   }

	   wait(for: [didFinish], timeout: 5)

	   XCTAssertEqual(1, messageThreadController.messageThreads.count)
   }

	func testCreateMessage() {
		
	}
}
