//
//  MessageThreadControllerTest.swift
//  MessageBoardTests
//
//  Created by Austin Cole on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

@testable import Message_Board
import XCTest

class MessageThreadControllerTest: XCTestCase {

    override func setUp() {
        mtc = MessageThreadController()
    }
    func testFetchingMessages() {
        mtc?.fetchMessageThreads{
        }
        sleep(5)
        XCTAssert((mtc?.messageThreads.count)! > 0, "Expected MessageThreadController.messageThreads.count to be more than 0.")

    }
    func testCreateMessageThread() {
        mtc?.createMessageThread(with: "Hello World", completion: {})
        XCTAssert((mtc?.messageThreads.count)! > 0, "Expected MessageThreadController.messageThreads.count to be more than 0.")
    }
    
    var mtc: MessageThreadController?

}

