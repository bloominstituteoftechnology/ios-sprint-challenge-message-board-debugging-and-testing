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
    
    // MARK: - Helper Properties
    
    var messageThreadController = MessageThreadController()
    
    func testFetchThreads() {
        XCTAssertEqual("https://sprintchallenge-week10.firebaseio.com/", "\(messageThreadController.baseURL)")
    }
}
