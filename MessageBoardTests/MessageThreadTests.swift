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

        let expectation = XCTestExpectation(description: "Creating Thread")

        messageThreadController.createMessageThread(with: "Testing Thread Creation") { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(messageThreadController.messageThreads.last!.title, "Testing Thread Creation")

    }
    
    func testFetchingThread() {
        let messageThreadController = MessageThreadController()

        let expectation = XCTestExpectation(description: "Fetching Thread")

        messageThreadController.fetchMessageThreads(completion: { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testMessageCreation() {
        let messageThreadController = MessageThreadController()

        let expectation = XCTestExpectation(description: "Creating Message")
        
        XCTAssertEqual(messageThreadController.messageThreads[0].messages.count, 1)


        messageThreadController.createMessage(in: messageThreadController.messageThreads[0], withText: "Creating Message", sender: "Tester") { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)

    }
}
