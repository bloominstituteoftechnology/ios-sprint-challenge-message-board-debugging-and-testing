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
    
    var tableView: UITableView?
    
    func testFetchThreads() {
        
        messageThreadController.uiTesting = true
        
        messageThreadController.fetchMessageThreads {
            print("fetched")
        }
        
        XCTAssertNotNil(messageThreadController.messageThreads.count)

    }
    
    
    func testCreateThread() {
        
        messageThreadController.uiTesting = true
        
        let threadTitle = "Unit Test Thread"
        
        let countBefore = messageThreadController.messageThreads.count
        
        messageThreadController.createMessageThread(with: threadTitle) {
            print("New message Thread")
        }
        
        XCTAssertEqual(countBefore + 1, messageThreadController.messageThreads.count)
        
    }
    
    func testCreateMessage() {
        
        messageThreadController.uiTesting = true
        
        testCreateThread()
        
        let thread = messageThreadController.messageThreads[0]
        
        let senderName = "Steven"
        let messageText = "Did I pass?"
        
        let countBefore = messageThreadController.messageThreads[0].messages.count
        
        messageThreadController.createMessage(in: thread, withText: messageText, sender: senderName) {
            print("yay")
        }
        
        XCTAssertEqual(countBefore + 1, messageThreadController.messageThreads[0].messages.count)
      
    }
    
}
