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
    
    var messageThreadController: MessageThreadController?
    
    func testCreateThread() {
        
        messageThreadController?.fetchMessageThreads(completion: {
            print("Fetched")
        })
        
        let countBefore = messageThreadController?.messageThreads.count
        
        let threadTitle = "Unit Test 2"
        
        messageThreadController?.createMessageThread(with: threadTitle, completion: {
            print("All if well")
        })
        
        XCTAssertEqual(countBefore! + 1, messageThreadController?.messageThreads.count)
        
    }
    
    
    func testCreateMessage() {
        
        
        
    }
    
}
