//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

import Firebase

@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    //MARK: - ENCODING AND DECODING TESTS
    
    func testCheckCreateNewAndEncode() {
        
        let testThreadController = MessageThreadController()
        let testThread = MessageThread(title: "Test Thread")
        
        testThreadController.messageThreads.append(testThread)
        let message = MessageThread.Message(text: "Test Checker Mesage", sender: "Mia")
        testThread.messages.append(message)
        
        let threadToJSON = try? JSONEncoder().encode(testThread)
        guard let data = threadToJSON else { return }
        XCTAssertNotNil(data)
        
        let threadFromJSON = try? JSONDecoder().decode(MessageThread.self, from: data)
        
     
        
        XCTAssertNotNil(testThreadController.messageThreads)
    }
    
    func testFetchRequests() {
        let testThreadController = MessageThreadController()
        XCTAssertNotNil(testThreadController.messageThreads)
       }
       
}
