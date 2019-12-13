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
        
        // reset local thread array to fetch fresh from server
        threadController = MessageThreadController()
        
        fetchThreadsFromServer()
        
        XCTAssertTrue(threadController.messageThreads.contains {
            $0.title == threadTitle
        })
    }
    
    func testCreateMessage() {
        let thread = createThread()
        let name = "name \(UUID().uuidString)"
        let messageText = "message \(UUID().uuidString)"
        
        createMessage(inThread: thread, withText: messageText, fromSender: name)
        
        XCTAssertTrue(thread.messages.contains() {
            $0.messageText == messageText && $0.sender == name
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
    
    func createThread() -> MessageThread {
        let threadTitle = createThreadWithRandomTitle()
        return threadController.messageThreads.first {
            $0.title == threadTitle
        }!
    }
    
    func createMessage(inThread thread: MessageThread, withText messageText: String, fromSender name: String) {
        let messageCreationDidFinish = expectation(description: "Finished creating message \"\(messageText)\" from sender \"\(name)\".")
        
        threadController.createMessage(
            in: thread,
            withText: messageText,
            sender: name)
        {
            messageCreationDidFinish.fulfill()
        }
        wait(for: [messageCreationDidFinish], timeout: 5)
    }
    
    func fetchThreadsFromServer() {
        let threadFetchDidFinish = expectation(
            description: "Finished fetching threads.")
        threadController.fetchMessageThreads {
            threadFetchDidFinish.fulfill()
        }
        wait(for: [threadFetchDidFinish], timeout: 5)
    }
}
