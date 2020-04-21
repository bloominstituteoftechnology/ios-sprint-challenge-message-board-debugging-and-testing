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
        let messageThreadController = MessageThreadController()
        createNewThread("New Thread", using: messageThreadController)
      
    }

    func testMessageSending() {
        let messageThreadController = MessageThreadController()
        let newThread = MessageThread(title: "New Thread")
        messageThreadController.messageThreads.append(newThread)
        
        XCTAssertTrue(newThread.messages.count == 0)
        
        let newMessage = MessageThread.Message(text: "This is the message", sender: "Gerardo")
        newThread.messages.append(newMessage)
        
        XCTAssertTrue(messageThreadController.messageThreads.count == 1)
    }
    
    
    private func createNewThread(_ threadTitle: String, using controller: MessageThreadController) {
        let existingMessageThreadCount = controller.messageThreads.count
        let expectation = self.expectation(description: "Creating new message thread")
        
        controller.createMessageThread(with: threadTitle) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
        
               XCTAssertEqual(controller.messageThreads.count, existingMessageThreadCount + 1)
               XCTAssertTrue(controller.messageThreads.contains(where: { $0.title == threadTitle }))
           }
    
}
