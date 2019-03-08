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
    
    func testFetchMessageThreadsFromServer() {
        let controller = MessageThreadController()
        controller.fetchMessageThreads {
            XCTAssertFalse(controller.messageThreads.isEmpty)
        }
    }
    
    func testCreateNewMessageThreadAndSendToServer() {
        let controller = MessageThreadController()
        var initialMessageThreadCount = 0
        controller.fetchMessageThreads {
            initialMessageThreadCount = controller.messageThreads.count
        }
        controller.createMessageThread(with: "Unit Test") { }
        controller.fetchMessageThreads {
            XCTAssertTrue(controller.messageThreads.count > initialMessageThreadCount)
        }
    }
}
