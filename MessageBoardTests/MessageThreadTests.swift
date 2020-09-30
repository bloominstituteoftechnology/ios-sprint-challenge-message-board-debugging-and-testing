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
   
    func testFetchingThreads() {
        let expectation = self.expectation(description: "Pause execution until tasks are fetched")
        
        messageThreadController.fetchMessageThreads {
            XCTAssert(self.messageThreadController.messageThreads.count > 0)
            print("Threads fetched")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testCreatingNewThread() {
        let expectation = self.expectation(description: "Pause til thread is created")
        
        let newThread = MessageThread(title: "Test New Thread")
        self.messageThreadController.createMessageThread(with: newThread.title) {
            XCTAssert(self.messageThreadController.messageThreads[0].title == "Test New Thread")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testCreatingNewMessage() {
        let expectation = self.expectation(description: "Pause till the message is created")
        
        messageThreadController.createMessage(in: MessageThread.init(title: "Test New Message"), withText: "Test", sender: "John") {
            print("Message created")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    

}
