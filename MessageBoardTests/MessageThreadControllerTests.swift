//
//  MessageThreadControllerTests.swift
//  MessageBoardTests
//
//  Created by Shawn Gee on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadControllerTests: XCTestCase {

    func testCreateMessageThread() throws {
        let messageThreadController = MessageThreadController()
        
        let expectation = XCTestExpectation(description: "Create Thread")
        messageThreadController.createMessageThread(with: "Testing") {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
        
        XCTAssertEqual(messageThreadController.messageThreads.last!.title, "Testing")
    }

}
