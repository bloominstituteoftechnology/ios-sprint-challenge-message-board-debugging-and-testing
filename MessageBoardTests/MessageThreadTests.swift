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
    func testCreateANewThreadCallsCompletion() {
        let didCallCompletion = expectation(description: "didComplete")
        MessageThreadController().createMessageThread(with: "Testing") {
            didCallCompletion.fulfill()
        }
        wait(for: [didCallCompletion], timeout: 0.5)
    }
    
}
