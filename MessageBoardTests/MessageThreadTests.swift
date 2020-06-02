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
    
    let messageThreadController = MessageThreadController()
    let messageThreadsTableViewController = MessageThreadsTableViewController()
    let messageThreadDetailTableViewController = MessageThreadDetailTableViewController()
    let messageDetailViewController = MessageDetailViewController()
    
    func testCreatedMainTableViewThreads() {
        
        XCTAssert((messageThreadsTableViewController.tableView != nil))
    }
    
    func testCreatedDetailTableViewThreads() {
        
        XCTAssert(messageThreadDetailTableViewController.tableView != nil)
    }
    
    func testfetchLocalMessageThreads() {
        
        let expectation = self.expectation(description: "Wait for live data")
        
        messageThreadController.fetchMessageThreads {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, 2)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    
}
