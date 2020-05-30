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
    
    func testCreatingThread() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createLocalMessageThread(with: "Test") {
            XCTAssertTrue(messageThreadController.messageThreads[0].title == "Test")
        }
    }
    
    func testCreatingMessage() {
        let messageThreadController  = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "Test") {
            let thread = messageThreadController.messageThreads[0]
            XCTAssertTrue(thread.title == "Test")
            
            messageThreadController.createMessage(in: thread, withText: "Message Test", sender: "Pravin", completion: {
                XCTAssertTrue(thread.messages[0].messageText == "Message Test")
            })
        }
    }
}
