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
        let controller = MessageThreadController()
        
        let didFinish = expectation(description: "didFinish")
        
        controller.createMessageThread(with: "Welcome to the Thunderdome!") {
            didFinish.fulfill()
        }
        
        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        // isInverted: Indicates that the expectation is not intended to happen
        // By adding bang (!) before it, we're testing that it indeed happened!
        XCTAssertTrue(!didFinish.isInverted, "⚠️ Writing message to the server failed.")
    }

}
