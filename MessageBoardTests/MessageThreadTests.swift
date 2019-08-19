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
    
    func testFetchMessages() {
        let messageBoard = MessageThreadController()
        messageBoard.fetchMessageThreads {
            if messageBoard.messageThreads.isEmpty {
                XCTFail("message thread empty")
            }
        }
//        XCTAssertNotNil(messageBoard.messageThreads.isEmpty)
    }  //test does not work as expected
    
    func testCreateThread() {
        let messageBoard = MessageThreadController()
        
        messageBoard.createMessageThread(with: "1") {
            XCTAssertTrue(messageBoard.messageThreads[0].title == "1")
        }
    }
}
