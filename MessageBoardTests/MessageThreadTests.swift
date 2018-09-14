//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase
{
    func testCreateThreadLocal()
	{
		let mc = MessageThreadController()
		mc.createLocalMessageThread(with: "TestThread", completion: {
			print(mc.messageThreads.count)
			print(mc.messageThreads.first!.title)
			XCTAssert(mc.messageThreads.count == 1)
			XCTAssert(mc.messageThreads.first!.title == "TestThread")
		})
	}

	func testCreateThreadNetwork()
	{
		let mc = MessageThreadController()
		mc.createMessageThread(with: "TestThread", completion: {
			print(mc.messageThreads.count)
			print(mc.messageThreads.first!.title)
			XCTAssert(mc.messageThreads.count == 1)
			XCTAssert(mc.messageThreads.first!.title == "TestThread")
		})
	}
}
