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
    
    override func setUp() {
       messageThreadController = MessageThreadController()
    }
   
    
    func testCreateNewThread() {
    
        let countMessages = messageThreadController.messageThreads.count
      
        messageThreadController.createMessageThread(with: "New Test Message") {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, countMessages+2, "creating message")
        
        }
}
    
    
    func testFetchMessages() {
    
        messageThreadController.fetchMessageThreads {
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
        }
        
        
    }
    
    
}
