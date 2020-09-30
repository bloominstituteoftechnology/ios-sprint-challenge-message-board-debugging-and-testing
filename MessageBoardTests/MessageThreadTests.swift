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
    let controller = MessageThreadController()
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    func testCreateThread() {
        let messageThread = MessageThread(title: "Test")
        let expectation = XCTestExpectation(description: "Create Thread")
        controller.createMessageThread(with: messageThread.title) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        
        XCTAssertTrue(self.controller.messageThreads[0].title == "Test")
    }
    func testCreateMessage() {
        let threadTitle = "Where are you?"
        let message = "Right here"
        let sender = "Rob"
        let expectation = XCTestExpectation(description: "Create Message")
        controller.createMessageThread(with: threadTitle) {
            self.controller.createMessage(in: self.controller.messageThreads[0], withText: message, sender: sender) {
                expectation.fulfill()
            }
            
        }
        
        self.wait(for: [expectation], timeout: 10)
        XCTAssertEqual(self.controller.messageThreads[0].messages[0].sender, sender)
    }
    func testLoadingMessages() {
        XCTAssertNotNil(controller.messageThreads)
    }
    
}
