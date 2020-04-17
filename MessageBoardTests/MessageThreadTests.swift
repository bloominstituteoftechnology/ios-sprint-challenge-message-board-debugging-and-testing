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
    
    let messageThreadController = MessageThreadController()
    
    func testCreationOfMessage() {
        let newMessage = MessageThread.Message(text: "Hi", sender: "Me")
        XCTAssertNotNil(newMessage)
    }
    
    func testCreationOfMessageThread() {
        let newMessageThread = MessageThread(title: "New Message")
        testCreationOfMessage()
        XCTAssertNotNil(newMessageThread)
        messageThreadController.messageThreads.append(newMessageThread)
        XCTAssertEqual(messageThreadController.messageThreads.count, 1)
    }
    
    
    func testFetchMessage() {
        messageThreadController.fetchMessageThreads {
            XCTAssertNotNil(self.messageThreadController.messageThreads)
        }
    }
    
    func testEncode() {
        testCreationOfMessage()
        let newMessageThread = MessageThread(title: "New Message")
        messageThreadController.messageThreads.append(newMessageThread)
        
        let data = try! JSONEncoder().encode(newMessageThread)
        XCTAssertNoThrow(data)
        
    }
    
    func testDecode() {
        let url = Bundle.main.url(forResource: "MockMessages", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        XCTAssertNoThrow(data)
        let datas = try! JSONDecoder().decode([String: MessageThread].self, from: data)
        let result = Array(datas.values)
        XCTAssertNoThrow(result)
    }
}
