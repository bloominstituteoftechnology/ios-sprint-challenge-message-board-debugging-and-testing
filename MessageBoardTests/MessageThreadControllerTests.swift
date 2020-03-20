//
//  MessageThreadControllerTests.swift
//  MessageBoardTests
//
//  Created by scott harris on 3/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadControllerTests: XCTestCase {

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    func testCreateMessageThread() {
        let messageThreadController = MessageThreadController()
        let currentMessageThreadsCount = messageThreadController.messageThreads.count
        
        let titleForTest = "Title From Unit Test"
        
        let dataExpectation = expectation(description: "PUT data to API")
        messageThreadController.createMessageThread(with: titleForTest) {
            dataExpectation.fulfill()
        }
        
        wait(for: [dataExpectation], timeout: 5)
        XCTAssertGreaterThan(messageThreadController.messageThreads.count, currentMessageThreadsCount)
    }
    
    func testGettingThreadsFromServer() {
        let messageThreadController = MessageThreadController()
        let currentMessageThreadsCount = messageThreadController.messageThreads.count
        
        let dataExpectation = expectation(description: "Get data to API")
        
        messageThreadController.fetchMessageThreads {
            dataExpectation.fulfill()
        }
        
        wait(for: [dataExpectation], timeout: 5)
        XCTAssertGreaterThan(messageThreadController.messageThreads.count, currentMessageThreadsCount)
    }

}
