//
//  MessageThreadControllerTests.swift
//  MessageBoardTests
//
//  Created by Lotanna Igwe-Odunze on 2/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadControllerTests: XCTestCase {

    func testNewThreadCreation() {
        //This should test createMessageThread function in Message Thread Controller.
        
        let MTC = MessageThreadController()
        
        let myTestThread = "Testing my new thread"
        
        MTC.createMessageThread(with: myTestThread) {
            
            //I expect that the message threads array will NOT be empty
            XCTAssertFalse(MTC.messageThreads.isEmpty)
            
            //I expect that the title of the most recently added thread will match the thread I just created
            XCTAssertEqual(MTC.messageThreads.last?.title, myTestThread)
            
            //I expect that the messages in the most recently created thread will be an empty array as my new thread doesn't yet have any messages.
            XCTAssertEqual(MTC.messageThreads.last?.messages, [])
        }
        
    } //End of function.
}
