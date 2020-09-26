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
    
    var messageThreadController = MessageThreadController()
   
    // Creating a new Thread
    func testNewThread() {
        let messageThread = MessageThread(title: "Testing")
        messageThreadController.createMessageThread(with: messageThread.title) {
            XCTAssertTrue(self.messageThreadController.messageThreads[0].title == "Testing")
        }
        
    }
    
    func testLoadMessage() {
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
    
    func testcreateMessage() {
        let messageTitle = MessageThread(title: "Sprint Challenge")
        messageThreadController.createMessageThread(with: messageTitle.title) {
            self.messageThreadController.createMessage(in: messageTitle, withText: "This one is confusing", sender: "NTL") {
                XCTAssertTrue(self.messageThreadController.messageThreads[0].messages[0].sender == "NTL")
            }
        }
        
        
        
        
    }
    
}//
