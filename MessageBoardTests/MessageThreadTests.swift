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
    
    //MARK: - Properties
    var messageThreadController: MessageThreadController!
    
    override func setUp() {
        messageThreadController = MessageThreadController()
        super.setUp()
    }
    
    func testCreatingMessageThread() {
        
        messageThreadController.createMessageThread(with: "Test Thread") {
            
            let messageThreads = self.messageThreadController.messageThreads
            XCTAssertGreaterThan(messageThreads.count, 0)
        }
    }
    
}
