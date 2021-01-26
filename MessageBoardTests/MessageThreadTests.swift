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
    
    let messageThreadController = MessageThreadController()
    
    var title = "Hector's passed me!"
    var messageTitle = MessageThread(title: "Test")
    var message = "Hector gave me a 3 for this sprint!"
    var sender = "Sammy"
    var exp = XCTestExpectation(description: "Create Thread")
    
    func testBaseURL() {
        XCTAssertEqual(MessageThreadController.baseURL, URL(string: "https://journal-ef092.firebaseio.com/")!)
    }

    func testLoadMessageThread() {
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
    
    func testCreateThread() {
        messageThreadController.createMessageThread(with: messageTitle.title) {
            self.exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
        
        XCTAssertTrue(self.messageThreadController.messageThreads[0].title == "Test")
        XCTAssertTrue(!self.messageThreadController.messageThreads.isEmpty)
    }
    
    func testCreateMessageThread() {
        messageThreadController.createMessageThread(with: title) {
            self.messageThreadController.createMessage(in: self.messageThreadController.messageThreads[0], withText: self.message, sender: self.sender) {
                self.exp.fulfill()
            }
        }
    }
    
    func testFetchMessageThread() {
        self.messageThreadController.fetchMessageThreads {
            self.exp.fulfill()
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
