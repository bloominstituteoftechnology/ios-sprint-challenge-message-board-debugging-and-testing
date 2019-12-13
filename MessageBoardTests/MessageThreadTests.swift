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
    var threadController: MessageThreadController!
    
    override func setUp() {
        self.threadController = MessageThreadController()
    }
    
    func testCreateThread() {
        let randomNumber = Double.random(in: 0...1000)
        let threadTitle = "new thread title \(randomNumber)"
        
        let threadCreationDidFinish = expectation(description: "Finished creating thread with title \(threadTitle)")
        
        threadController.createMessageThread(with: threadTitle) {
            threadCreationDidFinish.fulfill()
        }
        wait(for: [threadCreationDidFinish], timeout: 5)
        
        XCTAssertTrue(threadController.messageThreads.contains {
            $0.title == threadTitle
        })
    }
}
