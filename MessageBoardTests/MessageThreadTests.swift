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
    
    //Returns True If successful
    var creatingThreads: Bool {
        var messageThread = MessageThreadController()
        
        //Expectation
        let didFinish = expectation(description: "didFinish")
        var returnType = false
        
        //Networking
        messageThread.createMessageThread(with: "Test_Message") {
            DispatchQueue.main.async {
                didFinish.fulfill()
                returnType = true
            }
        }
        
        wait(for: [didFinish], timeout: 5)
        return returnType
    }
    
   /* var creatingMessages: Bool {
        
    }*/
    
    
    func testAll() {
        XCTAssertTrue(creatingThreads)
        //XCTAssertTrue(<#T##expression: Bool##Bool#>)
    }
}
