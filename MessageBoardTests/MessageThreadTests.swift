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
    // MARK: - Setup
    
    var threadController: MessageThreadController!
    
    override func setUp() {
        threadController = MessageThreadController()
    }
    
    // MARK: - Tests
    
    func testCreateThread() {
        let threadTitle = createThreadWithRandomTitle()
        
        XCTAssertTrue(threadController.messageThreads.contains {
            $0.title == threadTitle
        })
    }
    
    func testFetchFromServer() {
        let threadTitle = createThreadWithRandomTitle()
        let threadFetchDidFinish = expectation(
            description: "Finished fetching threads.")
        
        // reset local thread array to fetch fresh from server
        threadController = MessageThreadController()
        
        threadController.fetchMessageThreads {
            threadFetchDidFinish.fulfill()
        }
        wait(for: [threadFetchDidFinish], timeout: 5)
        
        XCTAssertTrue(threadController.messageThreads.contains {
            $0.title == threadTitle
        })
    }
    
    func testCreateMessage() {
        let threadTitle = createThreadWithRandomTitle()
        let thread = threadController.messageThreads.first {
            $0.title == threadTitle
        }!
        let name = "name \(UUID().uuidString)"
        let message = "message \(UUID().uuidString)"
        
        XCTAssertNotNil(thread)
        
        let messageCreationDidFinish = expectation(description: "Finished creating message \"\(message)\" from sender \"\(name)\".")
        
        threadController.createMessage(
            in: thread,
            withText: message,
            sender: name)
        {
            messageCreationDidFinish.fulfill()
        }
        wait(for: [messageCreationDidFinish], timeout: 5)
        
        XCTAssertTrue(thread.messages.contains() {
            $0.messageText == message
        })
    }
    
    // MARK: - Helper Methods
    
    func createThreadWithRandomTitle() -> String {
        let threadTitle = "new thread title \(UUID().uuidString)"
        
        let threadCreationDidFinish = expectation(
            description: "Finished creating thread with title \"\(threadTitle)\"")
        
        threadController.createMessageThread(with: threadTitle) {
            threadCreationDidFinish.fulfill()
        }
        wait(for: [threadCreationDidFinish], timeout: 5)
        return threadTitle
    }
    
    
}
