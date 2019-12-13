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
    
    // MARK: - Helper Methods
    
    func createThreadWithRandomTitle() -> String {
        let nonID = UUID().uuidString
        let threadTitle = "new thread title \(nonID)"
        
        let threadCreationDidFinish = expectation(
            description: "Finished creating thread with title \(threadTitle)")
        
        threadController.createMessageThread(with: threadTitle) {
            threadCreationDidFinish.fulfill()
        }
        wait(for: [threadCreationDidFinish], timeout: 5)
        return threadTitle
    }
}
