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
        let expectation = self.expectation(description: "Networked MessageThread")
        
        mtc.createMessageThread(with: "Hi there") {
            expectation.fulfill()
        }
        
        
        waitForExpectations(timeout: 5, handler: nil)
        
        
        XCTAssertTrue(mtc.messageThreads.count > 0)
    }
    
//    func testCreateMessage() {
//        var mtc = MessageThreadController()
//        mtc.createMessageThread(with: "Hi there") { }
//        let index = mtc.messageThreads.contains(<#T##element: MessageThread##MessageThread#>)
//        mtc.createMessage(in: mtc.messageThreads[0], withText: <#T##String#>, sender: <#T##String#>, completion: <#T##() -> Void#>)
//    }
}
