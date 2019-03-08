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
    let messageThreadsTableVC = MessageThreadsTableViewController()
    
    
    func testRetreivingMessages(){
        messageThreadsTableVC.retrieveMessages {
            XCTAssertGreaterThan(self.messageThreadsTableVC.tableView.numberOfRows(inSection: 0), 0)
        }
    }
    
    func testPostingMessage(){
        let testCount = messageThreadsTableVC.tableView.numberOfRows(inSection: 0)
        while(messageThreadsTableVC.isViewLoaded != true){
        messageThreadsTableVC.threadTitleTextField.text = "Test Text"
        messageThreadsTableVC.createThread(messageThreadsTableVC.threadTitleTextField)
        XCTAssertGreaterThan(self.messageThreadsTableVC.tableView.numberOfRows(inSection: 0), testCount)
        }
    }
    
}
