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
    
    func testDataTaskRuns() {
        
        let messageThreadController = MessageThreadController()
        
        let count = messageThreadController.messageThreads.count
        let expectation = XCTestExpectation(description: "Wait for data task.")
                
        messageThreadController.createMessageThread(with: "Test") {
            XCTAssertNotEqual(messageThreadController.messageThreads.count, count)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
                
    }
    
    func testFetchDataTask() {
        let messageThreadController = MessageThreadController()
        let count = messageThreadController.messageThreads.count
        let expectation = XCTestExpectation(description: "Wait for data task.")
                
        messageThreadController.fetchMessageThreads {
            XCTAssertNotEqual(messageThreadController.messageThreads.count, count)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        let expectation = XCTestExpectation(description: "Wait for data task.")
        
        messageThreadController.createMessageThread(with: "Message Test") {
            messageThreadController.createMessage(in: messageThreadController.messageThreads[0], withText: "Testing...", sender: "Cora") {
                XCTAssert(messageThreadController.messageThreads[0].messages[0].text == "Testing...")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testSegue() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let threadTVC = storyboard.instantiateViewController(identifier: "MessageThreadsTableViewController") as! MessageThreadsTableViewController
        let threadDetailTVC = storyboard.instantiateViewController(identifier: "MessageThreadDetailTableViewController") as! MessageThreadDetailTableViewController
        let segue = UIStoryboardSegue(identifier: "ViewMessageThread", source: threadTVC, destination: threadDetailTVC)
        let thread = MessageThread(title: "Some Title")
        threadTVC.messageThreadController.messageThreads.append(thread)
        let _ = threadTVC.tableView(threadTVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        threadTVC.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
        threadTVC.prepare(for: segue, sender: threadTVC.tableView)
        XCTAssertNotNil(threadDetailTVC.messageThreadController)
        XCTAssertNotNil(threadDetailTVC.messageThread)
    }
    
}
