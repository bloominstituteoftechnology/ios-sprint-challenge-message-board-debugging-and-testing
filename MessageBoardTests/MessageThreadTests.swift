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
let messageThreadTitle = "Friday night party"
var numberOfItemsInMessageThreads = 0
    
    func testCreateMessageThread() {
        messageThreadController.createLocalMessageThread(with:messageThreadTitle) {
            self.numberOfItemsInMessageThreads += 1
            XCTAssert(self.messageThreadController.messageThreads.count == self.numberOfItemsInMessageThreads, "failed to create a message thread.")
                }
    }
    
    func testCreateLocalMessage() {
        
        let fridayNightMessageThread = MessageThread(title: messageThreadTitle)
        messageThreadController.createLocalMessage(in: fridayNightMessageThread, withText: "lets meet up at 7", sender: "bob") {
            guard let index = self.messageThreadController.messageThreads.index(of: fridayNightMessageThread) else {return};            XCTAssert(!self.messageThreadController.messageThreads[index].messages.isEmpty, "unable to create message")
        }
        
    }
    
    func testFetchLocalMessageThreads() {
        
        let didFinish = expectation(description: "didFinish")
        var name = ""
        var messageThread: MessageThread?
        let url = messageThreadController.mockDataURL
        
  
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "brian"
            guard let data = data else {return}
            do {
                let messageThreadJson = try JSONDecoder().decode(MessageThread.self, from: data)
                messageThread = messageThreadJson
                guard let messageBoard = messageThread else {return}
                  messageBoard.messages.contains { (message) -> Bool in
                   if !message.sender.isEmpty{
                      name = message.sender
                           return true
                      } else {return false}

                  }
                  
            } catch {
                
            }
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait
   
//         Assertion only happens after the time out, or web request completes
    
         XCTAssertEqual("brian", name)
    }
}
