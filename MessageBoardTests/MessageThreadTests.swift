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
    
    // MARK: - Properties
    let controller = MessageThreadController()
    
    // MARK: - Tests
    // GOAL: - Create a thread and pass to server, check to see if the thread exists
    func testCreatingThreadAndSendToServer(){
        let messageThread = MessageThread(title: "Test")
        controller.createMessageThread(with: messageThread.title) {
            XCTAssertTrue(self.controller.messageThreads[0].title == "Test")
        }
    }
    
}
