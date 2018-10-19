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
    
    func testCreatingThread() {
        let messageThreadController = MessageThreadController()
        let expectationForCreatingMessageThread = expectation(description: "Finished creating a thread")
        messageThreadController.createMessageThread(with: "This is a test message thread") {
            expectationForCreatingMessageThread.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                NSLog("Error with expection: \(error)")
            }
            XCTAssertTrue(messageThreadController.messageThreads.first?.title == "This is a test message thread")
        }
    }
    
    func testCreatingMessages() {
        let messageThreadController = MessageThreadController()
        let expectationForCreatingMessage = expectation(description: "Finished creating a thread")
        var globalMessageThread: MessageThread?
        messageThreadController.createMessageThread(with: "This is a test message thread") {
            guard let messageThread = messageThreadController.messageThreads.first else {return}
            globalMessageThread = messageThread
            messageThreadController.createMessage(in: globalMessageThread!, withText: "This is a test message", sender: "Moin", completion: {
                expectationForCreatingMessage.fulfill()
            })
        }
        
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                NSLog("Error with expection: \(error)")
            }
            XCTAssert(globalMessageThread!.messages.first?.messageText == "This is a test message")
            XCTAssert(globalMessageThread!.messages.first?.sender == "Moin")
        }
    }
    
    
}
