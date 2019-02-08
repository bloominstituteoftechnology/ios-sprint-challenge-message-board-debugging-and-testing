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
    var messageThreadController: MessageThreadController!
    
    override func setUp() {
    messageThreadController = MessageThreadController()
    }
    
    func testFetchMassages() {
        messageThreadController.fetchMessageThreads {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, 0)
        }
    }
    
    func testNewMassage() {
        let string = "TESTING"
        let numberOfMessages = messageThreadController.messageThreads.count
        messageThreadController.createMessageThread(with: string) {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, numberOfMessages + 1)
        }
    }
    
   
   
}
