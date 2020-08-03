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

   let messageThreadController = MessageThreadController()

    // Test ability to create new thread
        func testCreateNewThread() {
            let newThread = MessageThread(title: "New Thread")
            messageThreadController.createMessageThread(with: newThread.title) {
                XCTAssertTrue(self.messageThreadController.messageThreads[0].title == "New Thread")

        }
    
}
}
