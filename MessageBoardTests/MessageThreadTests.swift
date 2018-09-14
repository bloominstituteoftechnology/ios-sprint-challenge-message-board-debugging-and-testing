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
    
    var messageThreads: [MessageThread]!
    var messageThreadController: MessageThreadController!
    
    override func setUp() {
        // Initialize messageThreads and -Controller for each test
        messageThreads = []
        messageThreadController = MessageThreadController()
    }
    
    // Initial bug: createThread: resume()
    func testCreateThread() {
        let threadTitle = "Test"
        messageThreadController.createMessageThread(with: threadTitle) {
            // Test if messageThread is not empty and its first thread has the title of the newly created test thread.
            XCTAssertFalse(self.messageThreadController.messageThreads.isEmpty)
            XCTAssertEqual(self.messageThreadController.messageThreads[0].title, threadTitle)
        }
    }
    
    // Initial bug: Fetching threads : try JSONDecoder().decode([MessageThread].self, from: data).
    func testThreadDecodingThreads() {
        messageThreadController.fetchMessageThreads {
            // Test if messageThread is not empty
            XCTAssertFalse(self.messageThreadController.messageThreads.isEmpty)
        }
    }
    
    
    // Initial bug: decoding message: try container.decodeIfPresent([Message].self, forKey: .messages)? ?? []
    func testThreadDecodingMessages() {
        
//        let thread = MessageThread(title: "Test")
//        let encodedMessage = try! JSONSerialization.data(withJSONObject: thread, options: .prettyPrinted)
//        // let jsonMessage = try! JSONSerialization.jsonObject(with: encodedMessage, options: [])
//        let decodedMessage = try! Array(JSONDecoder().decode([String : MessageThread].self, from: encodedMessage).values)
//        print(decodedMessage)
    }
    
    // Initial bug: after hitting send the view did not pop back to the Thread view controller
    // To be tested in UITests
    
    // Initial bug: segue.identifier == "AddMesage" --> did not pass required properties in segue
    // To be tested in UITests

}
