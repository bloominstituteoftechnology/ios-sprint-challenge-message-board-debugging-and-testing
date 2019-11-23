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
    
    let messageThreadController = MessageThreadController()
    let messageThreadsTableViewController = MessageThreadsTableViewController()
    
    func testMessageThreadsExistOnLoad() {
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
    func testThreadCreation() {
        let completionResult = expectation(description: "completed")
        messageThreadController.createMessageThread(with: "Test") {
            completionResult.fulfill()
        }
        wait(for: [completionResult], timeout: 1)
    }
    
    func testCreatingMessages() {
        let newThread = expectation(description: "New Thread Created")
        let newMessage = expectation(description: "New Message Created")

        messageThreadController.createMessageThread(with: "New") {
            XCTAssertNotNil(self.messageThreadController.messageThreads.first(where: { $0.title == "New" }))
            newThread.fulfill()
        }
        wait(for: [newThread], timeout: 5)

        let thread = self.messageThreadController.messageThreads.first(where: { $0.title == "New" })

        messageThreadController.createMessage(in: thread!, withText: "new text test", sender: "bobby") {
            XCTAssertNotNil(self.messageThreadController.messageThreads.first(where: { $0.title == "New" })?.identifier)
            newMessage.fulfill()
        }
        wait(for: [newMessage], timeout: 5)
    }
}
