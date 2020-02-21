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
    
    func testCreateThread() {
        let mtc = MessageThreadController()
        let newThread = MessageThread(title: "Unit Testing New Thread")
        XCTAssertEqual(mtc.messageThreads.count, 0)
        mtc.createLocalMessageThread(with: "\(newThread)") {
            return
        }
        XCTAssertEqual(mtc.messageThreads.count, 1)
    }
    
    func testCreateMessage() {
        let mtc = MessageThreadController()
        XCTAssertEqual(mtc.messageThreads.count, 0)
        let newThread = MessageThread(title: "Unit Testing New Thread")
        mtc.messageThreads.append(newThread)
        XCTAssertEqual(mtc.messageThreads.count, 1)
        XCTAssertEqual(newThread.title, "Unit Testing New Thread")
        XCTAssertEqual(newThread.messages.count, 0)
        let newMessage = MessageThread.Message(text: "Unit Testing New Message", sender: "Miguel")
        newThread.messages.append(newMessage)
        XCTAssertEqual(newThread.messages.count, 1)
        XCTAssertEqual(newThread.messages[0].sender, "Miguel")
        XCTAssertEqual(newThread.messages[0].messageText, "Unit Testing New Message")
        
    }
    
    func testDecodeMessageThread() {
        let url = Bundle.main.url(forResource: "MockMessages", withExtension: ".json")
        let data = try! Data(contentsOf: url!)
        XCTAssertNoThrow(data)
        let decoder = JSONDecoder()
        let messageThreads = Array(try! decoder.decode([String : MessageThread].self, from: data).values)
        XCTAssertNoThrow(messageThreads)
    }
    
    func testEncodeMessageThread() {
        let mtc = MessageThreadController()
        let encoder = JSONEncoder()
        let newThread = MessageThread(title: "Unit Testing New Thread")
        mtc.messageThreads.append(newThread)
        let newMessage = MessageThread.Message(text: "Unit Testing New Message", sender: "Miguel")
        newThread.messages.append(newMessage)
        let encodedThread = try! encoder.encode(newThread)
        XCTAssertNoThrow(encodedThread)
    }
}
