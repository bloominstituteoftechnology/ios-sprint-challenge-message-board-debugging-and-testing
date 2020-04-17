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
    
    func testLoadFirebase() {
        // MARK: - This test assumes there's atleast one thread in the server
        let didFinish = expectation(description: "didFinish")
        var threads: [MessageThread] = []
        let url = URL(string: "https://ios-albums-ff76b.firebaseio.com/.json")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                do {
                    let results = try JSONDecoder().decode([String : MessageThread].self, from: data)
                    threads = Array(results.values)
                    didFinish.fulfill()
            } catch {
                
                NSLog("Error decoding message threads from JSON data: \(error)")
                }
            }
            
        }.resume()
        
        wait(for: [didFinish], timeout: 10)
        
        XCTAssertFalse(threads.isEmpty)
        
    }
    
    func testNewThread() {
        let mtc = MessageThreadController()
        mtc.createLocalMessageThread(with: "Test Thread") {
            NSLog("Finished creating test Thread")
        }
        XCTAssertFalse(mtc.messageThreads.isEmpty)
    }
    
    func testNewMessage() {
        let mtc = MessageThreadController()
        mtc.createLocalMessageThread(with: "Test Thread") {
            NSLog("Finished creating test Thread")
        }
        let thread = mtc.messageThreads[0]
        mtc.createLocalMessage(in: thread, withText: "Test Message", sender: "Test Sender") {
            NSLog("Finished creating test message in thread")
        }
        XCTAssertFalse(thread.messages.isEmpty)
    }
    
}
