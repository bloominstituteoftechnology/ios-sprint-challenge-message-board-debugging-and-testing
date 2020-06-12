//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    

    private var messageThreadController: MessageThreadController!
    
  
    override func setUp() {
        messageThreadController = MessageThreadController()
    }
    

    func testCreateThread() {
        messageThreadController?.createMessageThread(with: "Goober", completion: {
            let allThreads = self.messageThreadController?.messageThreads
            XCTAssertGreaterThan(allThreads!.count, 0, "testCreateThread failed. Count is 0")
        })
    }
    

    func testCreatMessage() {
        messageThreadController?.createMessageThread(with: "Goober", completion: {
            let allThreads = self.messageThreadController?.messageThreads
            guard let firstThread = allThreads?.first else {return}
            
            self.messageThreadController.createMessage(in: firstThread, withText: "test message", sender: "Ben Dover") {
                let allMessages = firstThread.messages
                XCTAssertGreaterThan(allMessages.count, 0, "testCreateMessage failed. Count is 0")
            }
        })
    }
}
