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

    let messageThreadController =  MessageThreadController()
    let testThreadName = "Friday night"
    
    
    func testCreateThread() {
        messageThreadController.createMessageThread(with: testThreadName) {
        
        }
        
        if self.messageThreadController.messageThreads.count == 0 {
                      XCTAssert(false)
                  } else if self.messageThreadController.messageThreads.count != 0 {
                      XCTAssert(true)
                  }
   
    }
    
    
}
