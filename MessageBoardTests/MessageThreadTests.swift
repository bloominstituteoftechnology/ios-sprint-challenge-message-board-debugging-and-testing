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

    // Test ability to create new thread
        func testCreateNewThread() {
            let newThread = MessageThread(title: "New Thread")
            messageThreadController.createMessageThread(with: newThread.title) {
                XCTAssertTrue(self.messageThreadController.messageThreads[0].title == "New Thread")

        }
    
}

    func testCreatingMessage() {
        let messageThread = MessageThread(title: "Unit Thread Test")
        messageThreadController.createMessageThread(with: messageThread.title){
            self.messageThreadController.createMessage(in: messageThread, withText: "Positive result", sender: "IGF") {
                XCTAssertTrue(self.messageThreadController.messageThreads[0].messages[0].sender == "IGF")
            }
        }
    }


    // Test asynchronous logic using an expectation
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
