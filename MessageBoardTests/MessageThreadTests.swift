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
    
    func testCreatingNewThread() {
        let messageThreadController = MessageThreadController()
        createMessageThread(withTitle: "New Thread Title", using: messageThreadController)
    }
    
}

extension MessageThreadTests {
    
    private func createMessageThread(withTitle threadTitle: String, using controller: MessageThreadController) {
        let existingMessageThreadCount = controller.messageThreads.count
        let expectation = self.expectation(description: "New Thread Title")
        
        controller.createMessageThread(with: threadTitle) {
            expectation.fulfill()
        }
        
        assertExpectation(expectation)
        
        XCTAssertEqual(controller.messageThreads.count, existingMessageThreadCount + 1)
        XCTAssertTrue(controller.messageThreads.contains(where: { $0.title == threadTitle }))
    }
    
    private func assertExpectation(_ expectation: XCTestExpectation, timeout: Double = 5.0) {
        waitForExpectations(timeout: timeout) { error in
            if let error = error {
                XCTAssert(false, "\(error)")
            }
        }
    }
}
