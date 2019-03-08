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
    
    
    func testCreateMessageThread() {
        messageThreadController.createMessageThread(with: "Unit Test Thread") {
            let messageThreads = self.messageThreadController.messageThreads
            XCTAssert(messageThreads.count > 0, "Test sucessfully created and located atleast on message thread")
        }
    }
}
