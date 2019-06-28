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
    
    func testCreatingMessageThread(){
        let fakeTitle = "fakeTitle"
        let createMessage = MessageThread(title: fakeTitle)
        XCTAssertNotNil(createMessage)
    }
    
    func testCreatingMessages(){
        let text = "text"
        let sender = "this is the sender"
        let createdMessage = MessageThread.Message(text: text, sender: sender)
        XCTAssertNotNil(createdMessage)
    }
    
    func testFetchingMessageThreadsFromServer(){
        var thread: MessageThread?
        let url = URL(string: "https://mrf-message-board.firebaseio.com/")!
        let realURL = url.appendingPathExtension("json")
        do {
            let data = try Data(contentsOf: realURL)
            thread = try JSONDecoder().decode([String: MessageThread].self, from: data).compactMap { $0.value }.first
            print("this is the thread: \(String(describing: thread))")
        } catch {
            print("error here duh: \(error), more about the error: \(error.localizedDescription)")
        }
        XCTAssertNotNil(thread)
    }
    
}
