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
    
    func testDownloadingStuff() {
        
        let messageThreadController = MessageThreadController()
        let messageThreads: [MessageThread] = []
        
        try! messageThreadController.fetchMessageThreads {
            NSLog("error")
        }
        XCTAssertTrue(messageThreads.isEmpty)
    }
    
    

}
