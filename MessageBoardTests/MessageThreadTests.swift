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
        self.messageThreadController = MessageThreadController()
    }
    
    func testCreateThread() {
        let threadTitle = "This is a new thread's title"
        messageThreadController.createMessageThread(with: threadTitle) {
            print("hi")
        }
    }
}
