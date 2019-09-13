//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadControllerTests: XCTestCase {
    
    func testCreateThreadIncreaseThreadCount() {
        let messageThreadController = MessageThreadController()
        
        let originalCount = messageThreadController.messageThreads.count
        
        let didFinish = expectation(description: "didFinish")
        
        messageThreadController.createMessageThread(with: "UItest") {
            didFinish.fulfill()
        }
        wait(for: [didFinish], timeout: 5)
        
        XCTAssertEqual(originalCount + 1, messageThreadController.messageThreads.count)
    }
    
    func testLoadThreadCorrectCount() {
        let messageThreadController = MessageThreadController()
        
        let didFinish = expectation(description: "didFinish")
        let didFinishFetchNumber = expectation(description: "didFinishFetchNumber")
        var numberOfThread = 0
        let url = URL(string: "https://debugmessage-9110c.firebaseio.com/.json")!
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching number of thread: \(error)")
                return
            }
            
            guard let data = data else {
            print("no data on fetch number of thread")
                return
            }
            
            do {
                let threads = try JSONDecoder().decode([String : MessageThread].self, from: data)
                numberOfThread = threads.count
                didFinishFetchNumber.fulfill()
            } catch {
                print("Error decoding thread count: \(error)")
            }
            
        }.resume()
        
        messageThreadController.fetchMessageThreads {
            didFinish.fulfill()
        }
        
        wait(for: [didFinish, didFinishFetchNumber], timeout: 5)
        
        XCTAssertEqual(numberOfThread, messageThreadController.messageThreads.count) // input number of message thread in server, do this test seperately
    }
    
    func testCreateMessage() {
        let messageThreadController = MessageThreadController()
        
        let didFinish = expectation(description: "didFinish")
        
        let didCreateMessage = expectation(description: "didCreateMessage")
        
        messageThreadController.fetchMessageThreads {
            didFinish.fulfill()
        }
        
        wait(for: [didFinish], timeout: 5)
        let originalCount = messageThreadController.messageThreads[0].messages.count
        
        
        messageThreadController.createMessage(in: messageThreadController.messageThreads[0], withText: "new message test", sender: "brad") {
            didCreateMessage.fulfill()
        }
        wait(for: [didCreateMessage], timeout: 5)
        
        XCTAssertEqual(originalCount + 1, messageThreadController.messageThreads[0].messages.count)
    }
    
    
    
    
    
}
