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
    
    // MARK: - Properties
    var messageThreadController: MessageThreadController {
        MessageThreadController()
    }
    
    // Testing to see if multiple threads can be created
    func testCreatingMessageThread() {
        
        messageThreadController.createMessageThread(with: thread1) {
            XCTAssertTrue(self.messageThreadController.messageThreads.count == 1)
        }
        messageThreadController.createMessageThread(with: thread2) {
            XCTAssertTrue(self.messageThreadController.messageThreads.count == 2)
        }
    
    }
    
    let thread1 = "Thread 1"
    let thread2 = "Thread 2"
    
    // Testing to create message
    func testCreateMessage() {
        
        XCTAssertEqual(messageThreadController.messageThreads.count, 0)
        let newThread = MessageThread(title: "Unit Testing New Thread")
        messageThreadController.messageThreads.append(newThread)
        
        let newMessage = MessageThread.Message(text: "Unit Testing New Message", sender: "Chris")
        newThread.messages.append(newMessage)
        XCTAssertEqual(newThread.messages.count, 1)
        XCTAssertEqual(newThread.messages[0].sender, "Chris")
        XCTAssertEqual(newThread.messages[0].messageText, "Unit Testing New Message")

    }
    // Testing BaseURL
    func testBaseURL() {
        XCTAssertEqual(messageThreadController.baseURL, URL(string: "https://messageboard-e600b.firebaseio.com/"))
    }
    
    // Testing Encoding Message
    func testEncodeMessage() {
        let newMessage = ["TestMessage":MessageThread.Message(text: "Hi", sender: "Chris")]
        let encodedMessage = try? JSONEncoder().encode(newMessage.self)
        XCTAssertNotNil(encodedMessage)
    }
    
    // Testing Decoding Message
    func testDecodeMessage() {
       let newMessage = ["TestMessage":MessageThread.Message(text: "Hi", sender: "Chris")]
       let encodedMessage = try? JSONEncoder().encode(newMessage.self)
        XCTAssertNotNil(encodedMessage)
        let decodedMessageResult = try! JSONDecoder().decode([String:MessageThread.Message].self, from: encodedMessage!)
        let decodedMessage = decodedMessageResult.map { $0.value }
        XCTAssert(decodedMessage[0].messageText == "Hi")
        XCTAssert(decodedMessage[0].sender == "Chris")
    }

    
}
