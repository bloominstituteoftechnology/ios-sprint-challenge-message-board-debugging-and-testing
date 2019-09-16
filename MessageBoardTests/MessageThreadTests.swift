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
	
	let newMessage = MessageThread.Message(text: "iHop", sender: "Dave", timestamp: Date())
	let newThread = MessageThread(title: "Where to eat", messages: [MessageThread.Message(text: "iHop", sender: "Dave", timestamp: Date())], identifier: "12345")
	
	override func setUp() {
		messageThreadController = MessageThreadController()
	}
	
	func testNewThread() {
		XCTAssertEqual("iHop", newThread.messages[0].text)
	}
	
	func testNewMessage() {
		XCTAssertEqual("iHop", newMessage.text)
	}
	
	func testJsonDecoding() {
		let didFinish = expectation(description: "didFinish")
		
		messageThreadController.fetchMessageThreads {
			didFinish.fulfill()
		}
		
		wait(for: [didFinish], timeout: 5)
		
		XCTAssertNotNil(messageThreadController.messageThreads.first?.identifier)
	}
	
	func testThreadEncoding() {
		let threadDidFinish = expectation(description: "didFinish")
		let messageDidFinish = expectation(description: "didFinish")
		
		messageThreadController.createMessageThread(with: "Test Thread") {
			threadDidFinish.fulfill()
		}
		wait(for: [threadDidFinish], timeout: 5)
		
		XCTAssertEqual(messageThreadController.messageThreads.count, 1)
		
		let thread = messageThreadController.messageThreads[0]
		messageThreadController.createMessage(in: thread, withText: "I wrote stuff here", sender: "TestUser") {
			messageDidFinish.fulfill()
		}
		wait(for: [messageDidFinish], timeout: 5)
		
		XCTAssertEqual(messageThreadController.messageThreads.first?.messages.count, 1)
	}
	
}
