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
    
    /// 4.1 Test Creating a new Thread
    func testCreatingNewThread() {
        let messeageThreadController = MessageThreadController()
        createNewThread(withTitle: "Test Thread", using: messeageThreadController)
    }
    
    /// 4.2 Test Creating a new Message
    func testCreatingNewMessage() {
        let messeageThreadController = MessageThreadController()
        let threadTitle = "New Message Thread"
        createNewThread(withTitle: threadTitle, using: messeageThreadController)
        
        let thread = messeageThreadController.messageThreads.first(where: { $0.title == threadTitle})!
        let sender = "John Holowesko"
        let text = "New message for testing"
        
        let expectation = self.expectation(description: "Creating new message in thread: \(thread.title)")
        
        messeageThreadController.createMessage(in: thread, withText: text, sender: sender) {
            expectation.fulfill()
        }
        
        assertExpectation(expectation)
        XCTAssertEqual(thread.messages.count, 1)
        XCTAssertEqual(thread.messages[0].messageText, text)
    }
    
    
    
}


// MARK: - Extentions

extension MessageThreadTests {
    
    fileprivate func createNewThread(withTitle threadTitle: String, using controller: MessageThreadController) {
        let existingMessageThreadCount = controller.messageThreads.count
        let expectation = self.expectation(description: "Creating new message thread")
        
        controller.createMessageThread(with: threadTitle) {
            expectation.fulfill()
        }
        
        assertExpectation(expectation)
        
        XCTAssertEqual(controller.messageThreads.count, existingMessageThreadCount + 1)
        XCTAssertTrue(controller.messageThreads.contains(where: { $0.title == threadTitle }))
    }
    
    /// Custom Timeout Expection for "Loading"
    fileprivate func assertExpectation(_ expectation: XCTestExpectation, timeout: Double = 5.0) {
        waitForExpectations(timeout: timeout) { error in
            if let error = error {
                XCTAssert(false, "\(error)")
            }
        }
    }
    
}
