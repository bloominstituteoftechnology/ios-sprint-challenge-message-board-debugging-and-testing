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
let baseURL = URL(string: "https://journal-790a5.firebaseio.com/")!

class MessageThreadTests: XCTestCase {
    
    //Test for Bugs 1 and 2 in Bugs.md
    func testCreateThread() {
        let didFinish = expectation(description: "didFinish")
        messageThreadController.createMessageThread(with: "Test") {
            messageThreadController.fetchMessageThreads {
                didFinish.fulfill()
            }
        }
        wait(for: [didFinish], timeout: 5)
        XCTAssertNotEqual(messageThreadController.messageThreads, nil)
    }
}
