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
    
//    override func setUp() {
//        super.setUp()
//    }
    
    func testCreateMessageThread() {
        //.resume was missing from the method originally
        let messageThreadController = MessageThreadController()
        messageThreadController.fetchMessageThreads {
        }
        let originalThreadCount = messageThreadController.messageThreads.count
        messageThreadController.createMessageThread(with: "testThread") {
        }
        messageThreadController.fetchMessageThreads {
            XCTAssertNotEqual(messageThreadController.messageThreads.count, originalThreadCount)
            print(messageThreadController.messageThreads.count)
        }
    }
    
    func testFetchMessageThreads() {
        // Will fail if JSON is not decoded properly
        let messageThreadController = MessageThreadController()
        XCTAssertEqual(messageThreadController.messageThreads.count, 0)
        // Confirms messageThreads begin at ZERO then increase after FETCH
        messageThreadController.fetchMessageThreads(completion: {
            XCTAssertNotEqual(messageThreadController.messageThreads.count, 0)
        })
        
    }
    
   
}
