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
    var messageThreadsTableVC : MessageThreadsTableViewController?
    var messageThreadsDetailVC : MessageThreadDetailTableViewController?
    override func setUp() {
        messageThreadsTableVC = MessageThreadsTableViewController()
        messageThreadsDetailVC = MessageThreadDetailTableViewController()
    }
    
    func testRetreivingMessages(){
        messageThreadsTableVC!.retrieveMessages {
            XCTAssertGreaterThan(self.messageThreadsTableVC!.tableView.numberOfRows(inSection: 0), 0)
        }
    }
    
    
}
