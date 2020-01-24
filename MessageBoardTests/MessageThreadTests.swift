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
    
    
    func testCreatingNewThread() {
        let threadController = MessageThreadController()
        let testThread = MessageThread(title: "Testing")
        threadController.messageThreads.append(testThread)
        
        
        XCTAssertTrue(threadController.messageThreads.count == 1)
    }
    
    func testCreatingMessages() {
           let threadController = MessageThreadController()
           let testThread = MessageThread(title: "Testing")
           threadController.messageThreads.append(testThread)
           
           XCTAssertTrue(testThread.messages.count == 0)
           
           let testMessage = MessageThread.Message(text: "You are great", sender: "Me")
           testThread.messages.append(testMessage)
           
           XCTAssertTrue(testThread.messages.count == 1)
       }
       
       func testEncodingAMessageThread() {
           let threadController = MessageThreadController()
           
           let testThread = MessageThread(title: "Another One")
           threadController.messageThreads.append(testThread)
           
           let testMessage = MessageThread.Message(text: "Hello", sender: "me")
           testThread.messages.append(testMessage)
           
           let encodedThread = try? JSONEncoder().encode(testThread)
           guard let data = encodedThread else { return }
           let decodedThread = try? JSONDecoder().decode(MessageThread.self, from: data)
           
           XCTAssertEqual(testThread, decodedThread)
       }
 
    
}
