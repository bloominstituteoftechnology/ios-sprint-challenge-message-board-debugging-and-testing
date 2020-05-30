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
    
    var app: XCUIApplication!
    
    func testCreateThread() {
        let controller = MessageThreadController()
        controller.createMessageThread(with: "UITest Thread") {
            XCTAssert(controller.messageThreads.count > 0)
        }
    }
    
    func testCreateMessage() {
        let controller = MessageThreadController()
        controller.createMessageThread(with: "UITest Thread") {
            XCTAssert(controller.messageThreads.count > 0)
            controller.createMessage(in: controller.messageThreads[0], withText: "Testing", sender: "Someone") {
                sleep(2)
            }
        }
    }
}
