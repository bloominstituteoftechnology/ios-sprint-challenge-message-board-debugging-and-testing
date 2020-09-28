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
    
    func testCreatingNewThread() {
        let messageThreadController = MessageThreadController()
        createMessageThread(withTitle: "New Thread Title", using: messageThreadController)
    }
    
    func testCreatingNewMessage() {
            let messageThreadController = MessageThreadController()
            let threadTitle = "Thread created by: testCreatingNewMessage"
        createMessageThread(withTitle: threadTitle, using: messageThreadController)

            let thread = messageThreadController.messageThreads.first(where: { $0.title == threadTitle})!
            thread.messages = []
            XCTAssertTrue(thread.messages.isEmpty)

            let text = "dude. sweet. testing new message..."
            let sender = "Ben"

            let expectation = self.expectation(description: "Creating new message in thread: \(thread.title)")

            messageThreadController.createMessage(in: thread, withText: text, sender: sender) {
                expectation.fulfill()
            }

            assertExpectation(expectation)

            XCTAssertEqual(thread.messages.count, 1)
            XCTAssertEqual(thread.messages[0].sender, sender)
        }
    
}

extension MessageThreadTests {
    
    private func createMessageThread(withTitle threadTitle: String, using controller: MessageThreadController) {
        let existingMessageThreadCount = controller.messageThreads.count
        let expectation = self.expectation(description: "New Thread Title")
        
        controller.createMessageThread(with: threadTitle) {
            expectation.fulfill()
        }
        
        assertExpectation(expectation)
        
        XCTAssertEqual(controller.messageThreads.count, existingMessageThreadCount + 1)
        XCTAssertTrue(controller.messageThreads.contains(where: { $0.title == threadTitle }))
    }
    
    private func assertExpectation(_ expectation: XCTestExpectation, timeout: Double = 5.0) {
        waitForExpectations(timeout: timeout) { error in
            if let error = error {
                XCTAssert(false, "\(error)")
            }
            
    
            
        }
    }
}
