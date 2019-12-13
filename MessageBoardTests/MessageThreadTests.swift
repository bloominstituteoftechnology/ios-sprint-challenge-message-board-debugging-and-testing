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
    
    func testCreatingNewThread() {
        let threadController = MessageThreadController()
        let newThread = MessageThread(title: "New One")
        threadController.messageThreads.append(newThread)
        
        
        XCTAssertTrue(threadController.messageThreads.count == 1)
    }
    
    
}
