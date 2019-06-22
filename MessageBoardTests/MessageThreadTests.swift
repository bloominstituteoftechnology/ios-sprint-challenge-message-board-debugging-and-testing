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
    
    // Connect the MessageThreadsTableViewController() to our unit tests
    var messageDetailThreadsTable = MessageThreadDetailTableViewController()
    var messageThreadsController = MessageThreadController()
    override func setUp() {
        
    }
    
    // MARK: - Unit Testing: Datatask was not started
    func testMessageThreadsCreated() {
        messageThreadsController.createMessageThread(with: "Testing thread creation") {
             let numberOfThreads = self.messageThreadsController.messageThreads
            XCTAssertTrue(numberOfThreads.count > 0)
        }
        
    }
    
    // MARK: - Unit Testing: Fetched messages not decoded before saving
    func testFetchingMessages() {
        messageThreadsController.fetchMessageThreads {
            let fetchedMessageThreads = self.messageThreadsController.messageThreads
            XCTAssertTrue(fetchedMessageThreads.count > 0)
        }
    }
    
    // TODO: - Unit Testing: New message added to thread
    func testReturnFromMessageDetail() {
        // Check that message is added to thread
        let fetchedThread = self.messageThreadsController.messageThreads
        // Get the thread
        guard let messageThread = fetchedThread.first else { return }
        // Get the message for the thread
        let message = messageThread.messages
        XCTAssertTrue(message.count > 0)
        
    }
    
    
    
}
