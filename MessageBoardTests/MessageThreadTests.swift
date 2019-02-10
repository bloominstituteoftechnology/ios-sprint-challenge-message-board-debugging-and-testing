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
    
    override func setUp() {
        super.setUp()
        let messageThreadController = MessageThreadController()
    }
    /*
    Write tests for message thread controller
        Fetch
        Create Thread
     
     Tests for MessageDetail
        Create Message
    */
    
    func testGetWithBaseURL() {
        let messageThreadController = MessageThreadController()
        guard let url = URL(string: "https://message-board-debugging.firebaseio.com/") else {
            fatalError("URL can't be empty")
        }
        
        // get request
        let task = URLSession.shared.dataTask(with: url) {_,_,_ in
            // Return data
        }
        task.resume()
        // Assert
    }
    
    func testFetchThreads() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.fetchMessageThreads {
            XCTAssertTrue(messageThreadController.messageThreads.count == 0)
        }
    }
    
    func testCreateThread() {
        let messageThreadController = MessageThreadController()
        
        messageThreadController.createMessageThread(with: "New Thread") {
            let count = messageThreadController.messageThreads.count
            XCTAssert(count >= 1, "MessageThreads.count: \(count)")
        }
    }
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        
        let messageThread = MessageThread(title: "Message Thread Test")
        messageThreadController.createMessage(in: messageThread, withText: "Body Test", sender: "Sender Test") {
            XCTAssertNotNil(messageThread.messages)
            XCTAssertTrue(messageThread.title == "Message Thread Test")
            
        }
    }
    
    

}
