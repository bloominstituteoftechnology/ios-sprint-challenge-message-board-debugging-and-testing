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
    
//    func testDecoding() {
//        let url = Bundle.main.url(forResource: "MockMessages", withExtension: "json")!
//        let data = try! Data(contentsOf: url)
//        let messages = try! JSONDecoder().decode([String: MessageThread].self, from: data).map { $0.value }
//        XCTAssertNoThrow(messages)
//    }
    
    func testCreateThreadTitle() {
        let messageThreadController = MessageThreadController()
        let firstThread = messageThreadController.messageThreads.first?.title
        let title = "Test Thread"
        
        messageThreadController.createMessageThread(with: title) {
            XCTAssertEqual(firstThread, title)
        }
    }
    
    func testCreateThread() {
        let messageThreadController = MessageThreadController()
        let thread = MessageThread(title: "Test Thread")
        messageThreadController.createMessageThread(with: thread.title) {
            XCTAssertEqual(messageThreadController.messageThreads.count, 1)
        }
    }
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        let thread = MessageThread(title: "Test Thread")
        messageThreadController.messageThreads.append(thread)
        let message = MessageThread.Message(text: "Test Message", sender: "Tobi")
        thread.messages.append(message)
        let testCheck = thread.messages.count == 1
        XCTAssertTrue(testCheck)
    }
}
