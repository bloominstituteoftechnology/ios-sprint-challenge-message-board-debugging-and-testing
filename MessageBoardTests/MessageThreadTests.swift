//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//
import Foundation
import XCTest
@testable import Message_Board

let messageThreadController = MessageThreadController()

class MessageThreadTests: XCTestCase {
    
    //Test for Bugs 1 and 2 in Bugs.md
    func testCreateThread() {
        let didFinish = expectation(description: "didFinish")
        let thread = MessageThread(title: "Tesddy")
        messageThreadController.createMessageThread(with: thread) {
            messageThreadController.fetchMessageThreads {
                didFinish.fulfill()
            }
        }
        wait(for: [didFinish], timeout: 5)
        XCTAssertNotEqual(messageThreadController.messageThreads, nil)
    }
    
    func testMessageAddedInThread() {
        let message = MessageThread.Message(messageText: "Test1Message", sender: "Luqmaan")
        let thread = MessageThread(title: "Test1Thread", messages: [message], identifier: "010101")
        XCTAssertEqual(thread.messages[0], message)
    }
    
}

