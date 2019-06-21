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
	
	
	
	func test_createMessageThread() {
		messageThreadController.createMessageThread(with: thread1) {
			XCTAssertTrue(self.messageThreadController.messageThreads.count == 1)
		}
		messageThreadController.createMessageThread(with: thread2) {
			XCTAssertTrue(self.messageThreadController.messageThreads.count == 2)
		}
		
		
	}
	
	let thread1 = "Thread 1"
	let thread2 = "Thread 2"
	
	var messageThreadController: MessageThreadController {
		return MessageThreadController()
	}
    
}
