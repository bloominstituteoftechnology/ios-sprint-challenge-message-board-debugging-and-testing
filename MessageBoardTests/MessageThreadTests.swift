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
    
    func creatingNewThread() {
        messageThreadController.createMessageThread(with: "test") {
            XCTAssert(self.messageThreadController.messageThreads.count > 0)
            self.messageThreadController.createMessage(in: self.messageThreadController.messageThreads[0], withText: "hello", sender: "craig") {
                print("test completted")
            }
        }
    }
}
