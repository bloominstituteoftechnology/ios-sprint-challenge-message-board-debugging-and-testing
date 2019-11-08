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
    
    //MARK: Properties
    private let mTController = MessageThreadController()
    private let mTTableVC = MessageThreadsTableViewController()
    private let mDetailVC = MessageDetailViewController()
    
    
    func testfetchingAllThreads() {
        mTTableVC.tableView.reloadData()
        
        XCTAssertNotNil(mTController.messageThreads)
        
    }
    
    func testMakeThread() {
        
        let promise = expectation(description: "Thread Created")
        
        mTController.createMessageThread(with: "People") {
            XCTAssertNotNil(self.mTController.messageThreads.first(where: { $0.title == "People" }))
            promise.fulfill()

        }
        
        wait(for: [promise], timeout: 5)
    }
    
    func testMakeMessage() {
        
        let threadPromise = expectation(description: "Thread Created")
        let messagePromise = expectation(description: "Message Created")
        
        mTController.createMessageThread(with: "Events") {
            XCTAssertNotNil(self.mTController.messageThreads.first(where: { $0.title == "Events" }))
            threadPromise.fulfill()

        }
        
        wait(for: [threadPromise], timeout: 5)
        
        
        let thread = self.mTController.messageThreads.first(where: { $0.title == "Events" })
        
        mTController.createMessage(in: thread!, withText: "some text", sender: "some sender") {
            XCTAssertNotNil(self.mTController.messageThreads.first(where: { $0.title == "Events" })?.title)
            XCTAssertNotNil(self.mTController.messageThreads.first(where: { $0.title == "Events" })?.identifier)
            
            messagePromise.fulfill()
            
        }
        
        wait(for: [messagePromise], timeout: 5)
    }
    
    func testSegue() {
        
        mTTableVC.tableView.reloadData()
        
        let numberOfRows = mTTableVC.tableView.numberOfRows(inSection: mTTableVC.tableView.numberOfSections - 1)
        XCTAssertEqual(numberOfRows, mTController.messageThreads.count)
    }
}
