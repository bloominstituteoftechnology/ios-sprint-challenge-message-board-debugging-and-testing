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
    
    //MARK: - Properties
    let messageThreadController = MessageThreadController()
    let messageThreadName = "Friday Night Party"
    
    //MARK: - Helper methods
    func testCreateLocalMessageThread() {
        
        messageThreadController.createLocalMessageThread(with: messageThreadName) {
            for messageThread in self.messageThreadController.messageThreads {
                if messageThread.title == self.messageThreadName {
                    XCTAssert(true)
                } else {
                    XCTAssert(false, "failed to produce desired result.")
                }
            }
        }
    }
    
    
    func testCreateLocalMessage() {
        let messageText = "Hello there"
        let sender = "Tester"
        for messageThread in messageThreadController.messageThreads {
            if messageThread.title == messageThreadName {
                messageThreadController.createLocalMessage(in: messageThread, withText: messageText, sender: sender) {
                    for message in messageThread.messages {
                        if message.messageText == messageText && message.sender == sender {
                            XCTAssert(true, "test passed message created")
                        } else {
                            XCTAssert(false, "test failed message created but results arent the same")
                        }
                    }
                }
            }
        }
    }
    
    func testLocalFetchMessageThread() {
        
        messageThreadController.fetchLocalMessageThreads {
            for messagethread in self.messageThreadController.messageThreads {
                for message in messagethread.messages {
                    if message.sender == "Bob" || message.sender == "Joe" {
                        XCTAssert(true, "test wss succesful")
                    } else {
                        XCTAssert(false, "test failed to produce desired results")
                    }
                }
            }
        }
            
           }
}
