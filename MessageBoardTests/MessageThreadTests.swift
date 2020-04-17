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
    
    func testCreateThread() {
        let messageThreadController = MessageThreadController()
        let firstThread = messageThreadController.messageThreads.first?.title
        let title = "Test Thread"
        
        messageThreadController.createMessageThread(with: title) {
            XCTAssertEqual(firstThread, title)
        }
    }
}
