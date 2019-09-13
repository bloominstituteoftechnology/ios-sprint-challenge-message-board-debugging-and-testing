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
	
	let newMessage = MessageThread.Message(text: "iHop", sender: "Dave", timestamp: Date())
	let newThread = MessageThread(title: "Where to eat", messages: [MessageThread.Message(text: "iHop", sender: "Dave", timestamp: Date())], identifier: "12345")
	
	func testNewThread() {
		XCTAssertEqual("iHop", newThread.messages[0].text)
	}
	
	func testNewMessage() {
		XCTAssertEqual("iHop", newMessage.text)
	}
	
	func testFetchingData() {
		let didFinish = expectation(description: "didFinish")
		let messageThreadController = MessageThreadController()
		var isFulfilled = false
		
		messageThreadController.fetchMessageThreads {
			didFinish.fulfill()
			isFulfilled = true
		}
		
		wait(for: [didFinish], timeout: 5) // sync wait
		
		XCTAssertTrue(isFulfilled)
	}
	
}
