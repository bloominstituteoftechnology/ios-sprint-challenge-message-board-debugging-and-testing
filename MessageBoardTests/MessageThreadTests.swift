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
    
    func testAddingThreadToMessageBoard() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "Test") {
            return
        }
        
        let fetchedThreadMessages = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: messageThreadController.messageThreads, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func testAddingMessageToThread() {
        
    }
}
