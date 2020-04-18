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
    
    func testTheURLSession() {
        
        let baseURL = URL(string: "https://sprintchallengetest.firebaseio.com/")!
        let identifier = UUID().uuidString
        
        let requestURL = baseURL.appendingPathComponent(identifier).appendingPathExtension("json")
         var request = URLRequest(url: requestURL)
         request.httpMethod = "PUT"
        
        var value = ""
        let didFinish = expectation(description: "didFinish")
         
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            didFinish.fulfill()
            value = "value"
        }
        
        wait(for: [didFinish], timeout: 5)
        XCTAssertEqual("value", value)
        
    }
    
}
