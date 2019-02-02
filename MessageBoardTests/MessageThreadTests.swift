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
    
    
    
    func testAddingOneThread() {
        
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
    
    func testDecodingFromFetchServer() {

        let messageThreadController = MessageThreadController()
        let expectation = self.expectation(description: "Add Thread")
        
        messageThreadController.fetchMessageThreads {
            DispatchQueue.main.async {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3, handler: nil)

    }
    
    func testAddingOneMessageToAThread() {

        // Why too verbose but this works as long as
        // a one-in-100 million chance of a random collision
        // TODO: - Make more Efficient
        let messageThreadController = MessageThreadController()
        var randomInt = Int.random(in: 0...100000000)
        let newThreadTitle = "Thread\(randomInt)"

        
        messageThreadController.createMessageThread(with: newThreadTitle) {
            DispatchQueue.main.sync {
                
                guard let threadToTest = messageThreadController.messageThreads.filter( { return ($0.title == newThreadTitle) }).first else {
                    XCTAssertTrue(false)
                    return
                }
                
                randomInt = Int.random(in: 0...100000000)
                let newMessageSenderTitle = "Bot\(randomInt)"
                
                print(threadToTest)
                messageThreadController.createMessage(in: threadToTest, withText: newMessageSenderTitle, sender: "\(newMessageSenderTitle) text") {
                    
                    DispatchQueue.main.sync {
                        
                        guard let threadToTest2 = messageThreadController.messageThreads.filter( { return ($0.title == newThreadTitle) }).first else {
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
        }
        
        

    }
    
    
}
