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
   
    // Creating a new Thread
//    func testNewThread() {
//        let messageThread = MessageThread(title: "Testing")
//        messageThreadController.createMessageThread(with: messageThread.title) {
//            XCTAssertTrue(self.messageThreadController.messageThreads[0].title == "Testing")
//        }
//        
//    }
    
    func testLoadMessage() {
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
    
    func testcreateMessage() {
        let messageTitle = MessageThread(title: "Sprint Challenge")
        messageThreadController.createMessageThread(with: messageTitle.title) {
            self.messageThreadController.createMessage(in: messageTitle, withText: "This one is confusing", sender: "NTL") {
                XCTAssertTrue(self.messageThreadController.messageThreads[0].messages[0].sender == "NTL")
            }
        }
    }
    
    // Testing BaseURL
    func testBaseURL() {
        XCTAssertEqual(MessageThreadController.baseURL, URL(string: "https://journal-ef092.firebaseio.com/"))
    }
    
    
    func testCreatingThreadWithServer() {
        let didFinish = expectation(description: "didFinish")
        var success = false
        
        messageThreadController.createMessageThread(with: "New Thread") {
            didFinish.fulfill()
            success = true
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertTrue(success)
    }
    
    
    func testThreadsWithServer() {
        let didFinish = expectation(description: "didFinish")
        var success = false
        
        messageThreadController.fetchMessageThreads {
            didFinish.fulfill()
            success = true
        }
        
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertTrue(success)
    }
    
    
    func testCreatingMessageWithServer() {
        let didFinishCreating = expectation(description: "didFinishCreating")
        var successCreation = false
        
        messageThreadController.createMessageThread(with: "Message Thread") {
            didFinishCreating.fulfill()
            successCreation = true
        }
        
        wait(for: [didFinishCreating], timeout: 5)
        XCTAssertTrue(successCreation)
        
        let didFinishMessage = expectation(description: "didFinishMessage")
        var success = false
        let messageThread = messageThreadController.messageThreads[0]
        
        messageThreadController.createMessage(in: messageThread, withText: "Text", sender: "More Text") {
            didFinishMessage.fulfill()
            success = true
        }
        
        wait(for: [didFinishMessage], timeout: 5)
        
        XCTAssertTrue(success)
    }
    
    
}//
