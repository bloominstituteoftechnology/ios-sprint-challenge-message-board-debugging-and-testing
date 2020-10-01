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
    
    let expectation = XCTestExpectation()
    
    func testCreatingThreadAndSendToServer() {
        let expectation = XCTestExpectation()
        let messageThread = MessageThread(title: "Test")
        controller.createMessageThread(with: messageThread.title) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
        XCTAssertTrue(self.controller.messageThreads[0].title == "Test")

    }
    
    func testCreatingMessageOnThread() {
        let expectation = XCTestExpectation()
        let messageThread = MessageThread(title: "Lambda")
        controller.fetchMessageThreads {
            expectation.fulfill()
        }
//        controller.createMessageThread(with: messageThread.title){
//            self.controller.createMessage(in: messageThread, withText: "We've come so far", sender: "Clay") {
          
        wait(for: [expectation], timeout: 2.0)//
        XCTAssertTrue(!controller.messageThreads.isEmpty)
      //  XCTAssertTrue(self.controller.messageThreads[0].messages[0].sender == "Clay")
    }
    
    func testLoadingMessageThreads() {
        XCTAssertNotNil(controller.messageThreads)
    }
    
}

