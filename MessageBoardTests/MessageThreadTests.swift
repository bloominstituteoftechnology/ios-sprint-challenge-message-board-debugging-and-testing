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
    let testMessage = MessageThread(
        title: "Test Title XCTest",
        messages: [MessageThread.Message(text: "Hello from the XCTTestCase", sender: "Denis", timestamp: Date())])
    
    func testCreateThread() {
        let messageTread = MessageThread(title: testMessage.title)
        XCTAssertNotNil(messageTread)
    }
    
    func testCreatMessage() {
        let messageContent = testMessage.messages
        XCTAssertNotNil(messageContent)
    }
    
    func testCreatingMessageThread() {
        messageThreadController.createMessageThread(with: testMessage.title) {
            XCTAssertFalse(self.messageThreadController.messageThreads.isEmpty)
        }
        messageThreadController.createLocalMessageThread(with: "Hi") {
            XCTAssertFalse(self.messageThreadController.messageThreads.isEmpty)
        }
    }
    
            
    func testRetrevingMessageFromServer() {
        messageThreadController.fetchMessageThreads {
            XCTAssertFalse(self.messageThreadController.messageThreads.isEmpty)
        }
    }
    
    func testExpectation() {
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://apple.com")!

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "Dave"
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        XCTAssertEqual("Dave", name)
    }
}
