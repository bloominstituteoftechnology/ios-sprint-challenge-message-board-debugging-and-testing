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
    
    func testCreateMessageThread() {
        
        // bug 1) cannot create new thread
        
        messageThreadController.createMessageThread(with: "Testing") {
            XCTAssertNotEqual(self.messageThreadController.messageThreads, [])
        }
    }
    
    
    func testCreatingNewMessage() {
        
        // bug 2) clicking on send button not creating new message
        
        
        
    }
    
    func testFetchFromServer() {
        
        // bug 3) threads are not persisting, wont retrieve from firebase
        
    }
    
    
}
