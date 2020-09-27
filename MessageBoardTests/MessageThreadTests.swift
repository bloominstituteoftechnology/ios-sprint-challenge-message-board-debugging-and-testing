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
    
    
    let controller = MessageThreadController()
    
    func testCreatingThreadAndSendToServer() {
        let messageThread = MessageThread(title: "Test")
        controller.createMessageThread(with: messageThread.title) {
        XCTAssertTrue(self.controller.messageThreads[0].title == "Test")
        }
    }
    
    func testCreatingMessageOnThread() {
        let messageThread = MessageThread(title: "Lambda")
        controller.createMessageThread(with: messageThread.title){
            self.controller.createMessage(in: messageThread, withText: "We've come so far", sender: "Clay") {
                XCTAssertTrue(self.controller.messageThreads[0].messages[0].sender == "Clay")
            }
        }
    }
    
    func testLoadingMessageThreads() {
        XCTAssertNotNil(controller.messageThreads)
    }
}
