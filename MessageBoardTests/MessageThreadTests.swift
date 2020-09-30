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
    
    func testCreatingNewThread() {
        let expectation = self.expectation(description: "Pause execution until new thread is created")
        
        let newThread = MessageThread(title: "Unit Test 1")
        
        self.messageThreadController.createMessageThread(with: newThread.title) {
            XCTAssert(self.messageThreadController.messageThreads[0].title == "Unit Test 1")
            print("Thread created")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue(self.messageThreadController.messageThreads.count > 0, "Expectiong 1 results for MESSAGE THREAD")
    }
    
    func testCreatingNewMessage() {
        let expectation = self.expectation(description: "Pause execution until new message is created")
 
        messageThreadController.createMessageThread(with: "Message Test") {
            self.messageThreadController.createMessage(in: self.messageThreadController.messageThreads[0], withText: "Test", sender: "Bohdan") {
                XCTAssert(self.messageThreadController.messageThreads[0].messages[0].text == "Test")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    


func testFetchingThreads() {
    let expectation = self.expectation(description: "Pause execution until tasks are fetched")
    
    messageThreadController.fetchMessageThreads {
        XCTAssert(self.messageThreadController.messageThreads.count > 0)
        print("Threads fetched")
        expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 3)
    XCTAssertTrue(self.messageThreadController.messageThreads.count > 0, "Expectiong at least 1 thread")
}

}
