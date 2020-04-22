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
    
    var messageThreadController: MessageThreadController!
    
    override func setUp() {
        messageThreadController = MessageThreadController()
    }
    
    func testCreateNewThread(){
        
        XCTAssertNoThrow(messageThreadController.createMessageThread(with: "##TEST THREAD##", completion: {
            
        }))
//        XCTAssertNoThrow(MessageThread(title: "##TEST Thread- DO NOT USE##"))
        
    }
    
    func testCreateNewMessageOnThread(){
        
        let thread = MessageThread(title: "Test")
        XCTAssertNoThrow(messageThreadController.createMessage(in: thread, withText: "Hello", sender: "Tester123") {
            
        })
        
    }
    
    // TO TEST:
    //  1) Create new thread
    //  2) Add new messages to thread
    //
    //
    //
    
    
}
