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
    
    func testExpectation() {
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://apple.com")!

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "Dave"
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        XCTAssertEqual("Dave", name)
    }
    
    func testCreatingMessageThread() {
        
        let messageController = MessageThreadController()
        let expectation1 = XCTestExpectation(description: "Creating Thread")
        
        messageController.createMessageThread(with: "Testing Thread Creation") {
            expectation1.fulfill()
        }
        
        wait(for: [expectation1], timeout: 10)
        XCTAssertEqual(messageController.messageThreads.last!.title, "Testing Thread Creation")
    
    }
    
}
