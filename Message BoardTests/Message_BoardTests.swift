//
//  Message_BoardTests.swift
//  Message BoardTests
//
//  Created by Bobby Keffury on 12/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class Message_BoardTests: XCTestCase {

    func testFetchThreads() {
        let controller = MessageThreadController()
        
        controller.fetchMessageThreads {
            XCTAssert(!controller.messageThreads.isEmpty)
        }
        
    }
    

}
