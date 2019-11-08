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
    func testCreateThreadMessage() {
        let controller = MessageThreadController()
        XCTAssert(controller.messageThreads.count == 0)
        controller.createMessageThread(with: "Test", completion: {
            XCTAssert(controller.messageThreads.count == 1)
        })
    }
    
    func testFetchDataFromFirebase() {
        // Firebase has been already populated
        
        let controller = MessageThreadController()
        XCTAssert(controller.messageThreads.count == 0)
        controller.fetchMessageThreads {
             XCTAssert(controller.messageThreads.count > 0)
        }
    }
}
