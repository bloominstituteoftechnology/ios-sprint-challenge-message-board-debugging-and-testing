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
    
    
    
    func testNoErrorDecodingJSON() {
        
    }
    
    func testAddingOneThread() {
        
        // Why too verbose but this works as long as
        // a one-in-100 million chance of a random collision
        // TODO: - Make more Efficient
        let messageThreadController = MessageThreadController()
        let randomInt = Int.random(in: 0...100000000)
        let newThreadTitle = "Thread\(randomInt)"
        
        let expectation = self.expectation(description: "Add Thread")
        
        messageThreadController.createMessageThread(with: newThreadTitle) {
            
            DispatchQueue.main.async {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
        
        let filteredMessageThreads = messageThreadController.messageThreads.filter( { return ($0.title == "Thread\(randomInt)") } )
        guard let threadToTest = filteredMessageThreads.first else {
            XCTAssertTrue(false)
            return
        }
        
        XCTAssert(threadToTest.title == newThreadTitle)
        
    }
    
    func testAddingOneMessageToAThread() {
        
        // Why too verbose but this works as long as
        // a one-in-100 million chance of a random collision
        // TODO: - Make more Efficient
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "TestThread") {
            
            DispatchQueue.main.async {
                var filteredMessageThreads = messageThreadController.messageThreads.filter( { return ($0.title == "TestThread") } )
                guard let threadToTest = filteredMessageThreads.first else {
                    XCTAssertTrue(false)
                    return
                }
                
                let randomInt = Int.random(in: 0...100000000)
                let newMessageSenderTitle = "Bot\(randomInt)"
                
                
                messageThreadController.createMessage(in: threadToTest, withText: newMessageSenderTitle, sender: "\(newMessageSenderTitle) text") {
                    DispatchQueue.main.async {
                    }
                }
                
                filteredMessageThreads = messageThreadController.messageThreads.filter( { return ($0.title == "NewThread") } )
                guard let threadToTest2 = filteredMessageThreads.first else {
                    XCTAssertTrue(false)
                    return
                }
                let filteredMessages = threadToTest2.messages.filter( { return ($0.sender == newMessageSenderTitle) } )
                
                guard let messageToTest = filteredMessages.first else {
                    XCTAssertTrue(false)
                    return
                }
                print(messageToTest.sender)
                print(newMessageSenderTitle)
                
                XCTAssert(messageToTest.sender == newMessageSenderTitle)
            }
        }

    
        
    }
    
    func testSendButtonWorking() {
        
    }
    
    func testSenderNameRequirement() {
        
    }
    
    func testNoDuplicationOfThreads() {
        
    }
    
    func testGettingRightSegue() {
        
    }
    
}
