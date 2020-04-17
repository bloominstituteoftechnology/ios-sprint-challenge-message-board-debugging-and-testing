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
    
    func testThreadCreation() {
        let messageThreadController = MessageThreadController()
        // 1. Set up the expectation and give it a name
        let expectation = XCTestExpectation(description: "Creating Thread")
        // 2. Schedule some asyncronous work that will happen at a later time
        messageThreadController.createMessageThread(with: "Testing Thread Creation") { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        // 3. Tell the test to wait for the expectation you made before saying it's "finished"
        wait(for: [expectation], timeout: 10)
        // 6. More tests can be here if you want, but they will only occur after the expectations are fulfilled
    }
    
    func testMessageCreation() {
        let messageThreadController = MessageThreadController()
        // 1. Set up the expectation and give it a name
        let expectation = XCTestExpectation(description: "Creating Message")
        // 2. Schedule some asyncronous work that will happen at a later time
        messageThreadController.createMessage(in: messageThreadController.messageThreads[0], withText: "Creating Message", sender: "Tester") { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        // 3. Tell the test to wait for the expectation you made before saying it's "finished"
        wait(for: [expectation], timeout: 10)
        // 6. More tests can be here if you want, but they will only occur after the expectations are fulfilled
    }
}
