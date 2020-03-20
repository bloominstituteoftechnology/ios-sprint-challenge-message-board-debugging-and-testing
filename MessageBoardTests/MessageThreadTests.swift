//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
import UIKit
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    let messageThreadController = MessageThreadController()
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testCreateThread() {
        messageThreadController.createMessageThread(with: "XCTest") {
            XCTAssertEqual(self.messageThreadController.messageThreads[0].title, "XCTest")
        }
    }
    
    func testFetching() {
        messageThreadController.fetchMessageThreads {
            XCTAssertNotNil(self.messageThreadController.messageThreads.count)
        }
    }
    
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
}
