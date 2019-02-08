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
    
    /*
    Write tests for message thread controller
        Fetch
        Create Thread
     
     Tests for MessageDetail
        Create Message
    */
    
    func testGetWithBaseURL() {
        guard let url = URL(string: "https://message-board-debugging.firebaseio.com/") else {
            fatalError("URL can't be empty")
        }
        // get request
        let task = URLSession.shared.dataTask(with: url) {_,_,_ in
            // Return data
        }
        task.resume()
        // Assert
    }
    
    

}
