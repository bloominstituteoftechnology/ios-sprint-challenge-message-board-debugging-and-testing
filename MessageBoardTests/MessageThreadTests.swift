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
    
    func testFetchMessageThread() {
        
        let messageController = MessageThreadController()
        
        messageController.fetchMessageThreads {
            
            XCTAssertNotNil(messageController.messageThreads)
        }
    }
    
    func testCreateThread() {
        
        let messageController = MessageThreadController()
        
        messageController.createMessageThread(with: "Unit Test") {
            
            XCTAssert(messageController.messageThreads.last?.title == "Unit Test")
        }
    }
    
    func testCreateMessage() {
        
        let messageController = MessageThreadController()
        
        messageController.createMessageThread(with: "Unit Test") {
            XCTAssert(messageController.messageThreads.last?.title == "Unit Test")
            
            messageController.createMessage(in: messageController.messageThreads.last!, withText: "Hey", sender: "Christopher") {
                XCTAssert(messageController.messageThreads.last?.messages.last?.messageText == "Hey")
            }
        }
        

    }
    
}
