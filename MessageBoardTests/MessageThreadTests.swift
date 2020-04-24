//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
import UIKit
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    
    func confirmTableViewIsShowingData() {
        
    }
    
    func testThreadCreation() {
        
        let mtc = MessageThreadController()
        var testThreads: [MessageThread] = []
        
        mtc.createLocalMessageThread(with: "Test") {
            testThreads = mtc.messageThreads
        }
        
//        testThreads = mtc.messageThreads
        XCTAssert(testThreads.count != 0)
        
    }
}
