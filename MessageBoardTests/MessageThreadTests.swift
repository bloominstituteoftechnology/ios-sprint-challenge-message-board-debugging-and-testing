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
    
    
    // MARK: - test will not fail
    func testCreateThread () {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "John") {
            XCTAssert(messageThreadController.messageThreads.count > 0)
        }
    }
    
    // MARK: - Test is successful, but not sure if this is accurate
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "John") {
            XCTAssert(messageThreadController.messageThreads.count > 0)
            messageThreadController.createMessage(in: messageThreadController.messageThreads[0], withText: "Test", sender: "Me") {
                // something goes here
            }
        }
    }
    
    
    
    
}
