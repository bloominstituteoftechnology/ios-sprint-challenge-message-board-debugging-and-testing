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
    
    let goodData = """
        {
            "identifier":"D145B37B-79CD-4CC6-A31B-B04EA840E626",
            "title":"another thread"

        }

        """.data(using: .utf8)!
    

    
    override func setUp() {
        messageThreads = []
        messageThreadController = MessageThreadController()
    }
    
    func testCreatingMessageThread(){
        let title = "Title"
        let createMessage = MessageThread(title: title)
        XCTAssertNotNil(createMessage)
    }
    
    func testCreatingMessage(){
        let text = "text"
        let sender = "sender"
        let createdMessage = MessageThread.Message(text: text, sender: sender)
        XCTAssertTrue(createdMessage.text == text)
    }
    
    func testFetchMessageThread() {
        let expectations = expectation(description: "ValidJSONFormat")
        messageThreadController.fetchMessageThreads {
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3) { (error) in
            if let error = error {
                print("Error decoding JSON: \(error)")
            }
        }
        XCTAssertTrue(messageThreadController.messageThreads.count > 0)
    }
    
    func testJSONEncode() {
        let networkLoader = MockDataLoader(data: goodData, error: nil)
        let expectations = expectation(description: "ValidJSONFormat")
        let controller = MessageThreadController(networkLoader: networkLoader)
        let title = "another thread"
        controller.createMessageThread(with: title) {
            expectations.fulfill()
        }

        waitForExpectations(timeout: 3) { (error) in
            if let error = error {
                print("Error encoding JSON: \(error)")
            }
        }
        XCTAssertTrue(controller.messageThreads.last?.title == title)
    }
}
