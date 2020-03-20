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
    
      func testCreateMessageThread() {
          let expectation = XCTestExpectation(description: "Create Message Thread on Server")
          
        
          
          messageThreadController.createMessageThread(with: "Test") {
             
            XCTAssertNotEqual(self.messageThreadController.messageThreads.count, 0)
              
              expectation.fulfill()
          }
          
          wait(for: [expectation], timeout: 5)
      }
      
      func testFetchMessageThreadFromServer() {
          let expectation = XCTestExpectation(description: "Fetch Message Thread from Server")
          
          let messageThreadController = MessageThreadController()
          
          messageThreadController.fetchMessageThreads {
           
              XCTAssertNotEqual(messageThreadController.messageThreads.count, 0) 
              
              expectation.fulfill()
          }
          
          wait(for: [expectation], timeout: 5)
      }
    
 
}
