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
    
    var messageThreadController: MessageThreadController {
        return MessageThreadController()
    }
    
    func testCreateThread() {
        XCTAssertEqual(messageThreadController.messageThreads, [])
        
        messageThreadController.createMessageThread(with: "Test") {
            XCTAssert(self.messageThreadController.messageThreads.last?.title == "Test")
        }
    }
    
    func testFetchThread() {
        XCTAssertEqual(messageThreadController.messageThreads, [])
        
        messageThreadController.fetchMessageThreads {
            XCTAssertNotNil(self.messageThreadController.messageThreads)
        }
    }
    
    func testCreateMessage() {
        XCTAssertEqual(messageThreadController.messageThreads, [])
        
        messageThreadController.createMessageThread(with: "Test") {
            XCTAssert(self.messageThreadController.messageThreads.last?.title == "Test")
            
            self.messageThreadController.createMessage(in: (self.messageThreadController.messageThreads.last)!, withText: "This is a test", sender: "Lisa") {
                XCTAssert(self.messageThreadController.messageThreads.last?.messages.last?.messageText == "This is a test")
            }
        }
        
        
    }
}
