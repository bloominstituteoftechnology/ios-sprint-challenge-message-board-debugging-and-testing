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
    var threadTableView = MessageThreadsTableViewController()
	var threadController = MessageThreadController()


	func testMessagePopulatesAfterCreatingThread() {
		threadController.createMessageThread(with: "Testing With Unit Tests") {
			DispatchQueue.main.async {
				self.threadTableView.tableView.reloadData()
			}
		}
		XCTAssertTrue(threadController.messageThreads.count == 0)
	}
}
