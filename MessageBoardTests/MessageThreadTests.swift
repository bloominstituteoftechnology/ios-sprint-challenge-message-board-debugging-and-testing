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
    
    func testcreatingANewThread() {
        let expectation = self.expectation(description: "wait until ther is a new thread")
        let controller = MessageThreadController()
        
        controller.createMessageThread(with: "TESTING!") {
            print("We created a new thread")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        
    }
    
    func testCreatingANewMessage() {
        let expectation = self.expectation(description: "wait until ther is a new message")
        let controller = MessageThreadController()
        
        controller.createMessage(in: MessageThread.init(title: "1"), withText: "TEST", sender: "TESTPERSON") {
            print("We created a new message")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testFetchingThreads() {
        let expectation = self.expectation(description: "wait until all threads are fetched.")
        let controller = MessageThreadController()
        
        controller.fetchMessageThreads {
            print("Threads were fetched successfully")
            //MARK: - works without the greater than comparison but throws a weird error when it is uncomented.
            XCTAssertGreaterThan(controller.messageThreads.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        //MARK: - works without the greater than comparison but throws a weird error when it is uncomented.
        XCTAssertGreaterThan(controller.messageThreads.count, 0)
    }
}
