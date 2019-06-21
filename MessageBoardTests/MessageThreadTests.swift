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
    
    
    func testCreateMessageThread() {
        let controller = MessageThreadController()
        controller.createMessageThread(with: "Test Thread") { }
        
        usleep(1_000_000)
        
        XCTAssertTrue(controller.messageThreads.count > 0)
        
    }
    
    
    func testCreateMessageAndSave() {
        let messageThreadController = MessageThreadController()
        var initialMessageThreadCount = 0
        
        messageThreadController.fetchMessageThreads {
            initialMessageThreadCount = messageThreadController.messageThreads.count
        }
        usleep(1_000_000)
        messageThreadController.createMessageThread(with: "Test Thead Test 2") { }
        usleep(1_000_000)
        messageThreadController.fetchMessageThreads { }
        
        usleep(1_000_000)
        XCTAssertTrue(messageThreadController.messageThreads.count > initialMessageThreadCount)
    }

    
    func testServerFetch() {
        let controller = MessageThreadController()
        controller.fetchMessageThreads {
           
        }
        usleep(1_000_000)
         XCTAssertFalse(controller.messageThreads.isEmpty)
    }
    
//    // THESE ARE SET TO FAIL ON PURPOSE TO SHOW THAT THE ABOVE TESTS ARE WORKING!!
//    func testServerFetchProofFAIL() {
//        let controller = MessageThreadController()
//        controller.fetchMessageThreads {
//
//        }
//        usleep(1_000_000)
//        XCTAssertTrue(controller.messageThreads.isEmpty)
//    }
    
//
//    func testCreateMessageAndSave() {
//        let messageThreadController = MessageThreadController()
//        var initialMessageThreadCount = 0
//
//        messageThreadController.fetchMessageThreads {
//            initialMessageThreadCount = messageThreadController.messageThreads.count
//        }
//        usleep(1_000_000)
//        messageThreadController.createMessageThread(with: "Test Thead Test 2") { }
//        usleep(1_000_000)
//        messageThreadController.fetchMessageThreads { }
//
//        usleep(1_000_000)
//        XCTAssertFALSE(messageThreadController.messageThreads.count > initialMessageThreadCount)
//    }
//
//    func testCreateMessageThread() {
//        let controller = MessageThreadController()
//        controller.createMessageThread(with: "Test Thread") { }
//        
//        usleep(1_000_000)
//        
//        XCTAssertFalse(controller.messageThreads.count > 0)
//        
//    }
}
