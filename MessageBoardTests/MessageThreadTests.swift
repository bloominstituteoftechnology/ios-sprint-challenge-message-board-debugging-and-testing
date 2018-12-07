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
    
    func testNewThread() {
        let threadController = MessageThreadController()
        
        // create thread
        // test thread count
        threadController.createMessageThread(with: "Testing") {
            XCTAssert(threadController.messageThreads.count > 0)
        }
        
    }
    
    
    func testThreadsFromServer() {
        let threadController = MessageThreadController()
        
        // fetch threads
        // test thread count
        threadController.fetchMessageThreads {
            XCTAssert(threadController.messageThreads.count > 0)
        }
    }
    
}
