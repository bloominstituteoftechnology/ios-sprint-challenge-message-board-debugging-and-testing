//
//  MessageThreadControllerTests.swift
//  MessageBoardTests
//
//  Created by Lotanna Igwe-Odunze on 2/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageBoardTests: XCTestCase {

    func testNewThreadCreation() {
        //This should test createMessageThread function in Message Thread Controller.
        
        let MTC = MessageThreadController()
        
        let myTestThread = "Testing my new thread"
        
        MTC.createMessageThread(with: myTestThread) {
            
           //I expect a thread of the same title to exist
           XCTAssertEqual(MTC.messageThreads.last?.title, myTestThread)
        }
        
    } //End of function.
    
    
    func testNewMessageCreation() {
        
        let MTD = MessageThreadDetailTableViewController()
        
        
    }
}
