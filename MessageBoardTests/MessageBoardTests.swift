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
        
        let MTC = MessageThreadController()
        
        let myTestMessage = "Hello Message"
        let myTestSender = "Test Sender"
        guard let myTestThread = MessageThreadController().messageThreads.last else { return }
        
        
        MTC.createMessage(in: myTestThread, withText: myTestMessage, sender: myTestSender, completion: { } )
        
        XCTAssertEqual(MTC.messageThreads.last?.messages.first?.sender, myTestSender)

    }
}
