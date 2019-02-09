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
    var messageThreadController = MessageThreadController()
    
    func testFetchMessages() {
        messageThreadController.fetchMessageThreads {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, 0)
        }
    }
    
    func testCreateMessages() {
        let dinners = ["Teriyaki Kabobs", "Beef and Brocoli", "Korean BBQ"]
        var count = 1
        for dinner in dinners {
            messageThreadController.createMessageThread(with: dinner){
                XCTAssertEqual(self.messageThreadController.messageThreads.count, count)
                count += 1
            }
        }
    }
}
