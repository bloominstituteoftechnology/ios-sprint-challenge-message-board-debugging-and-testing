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
    
    func testCheckThreadEncodes() {
        let testThreadController = MessageThreadController()
        let thread = MessageThread(title: "Students")
        testThreadController.messageThreads.append(thread)
        
        let message = MessageThread.Message(text: "Hi Class!", sender: "Kristaps")
        thread.messages.append(message)
        
        let threadToJSON = try? JSONEncoder().encode(thread)
        guard let data = threadToJSON else { return }
        let threadFromJSON = try? JSONDecoder().decode(MessageThread.self, from: data)
        
        XCTAssertEqual(thread, threadFromJSON)
    }
    
    func testNewThreadCreated() {
        let testThreadController = MessageThreadController()
        let thread = MessageThread(title: "New Thread")
        testThreadController.messageThreads.append(thread)
        XCTAssert(testThreadController.messageThreads.count > 0)
    }
    
    func testCheckMessageEncodesAndDecodes() {
        let testThreadController = MessageThreadController()
        let thread = MessageThread(title: "Students")
        testThreadController.messageThreads.append(thread)
        
        let testMessage = MessageThread.Message(text: "3's To Go Around", sender: "Sameera")
        thread.messages.append(testMessage)
        
        let threadToJSON = try? JSONEncoder().encode(thread)
        guard let data = threadToJSON else { return }
        let threadFromJSON = try? JSONDecoder().decode(MessageThread.self, from: data)
        
        guard let message = threadFromJSON?.messages.first?.text else { return }
        
        XCTAssertEqual("3's To Go Around", message)
    }
    
    func testCreatingNewMessage() {
        let testThreadController = MessageThreadController()
        let thread = MessageThread(title: "New Thread")
        testThreadController.messageThreads.append(thread)
        
        XCTAssert(thread.messages.count == 0)
        
        let message = MessageThread.Message(text: "Hey y'all", sender: "Neil")
        thread.messages.append(message)
        
        XCTAssert(thread.messages.count > 0)
    }
    
    
}
