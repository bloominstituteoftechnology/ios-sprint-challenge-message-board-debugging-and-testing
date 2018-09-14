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
    
    func testCreateMessageThread() {
        // create a message thread
        var mtc = MessageThreadController()
        mtc.createMessageThread(with: "Hi there") { }
        XCTAssert(mtc.messageThreads.count > 0)
    }
    
    func testCreateMessage() {
        let mtc = MessageThreadController()
        
    }
}
