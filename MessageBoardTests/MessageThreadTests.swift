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
    
    var isUITesting = false
    let mockController = MessageThreadController()
    var tableView: UITableView?
    
    
    func expect(exists element: XCUIElement, file: String = #file, line: UInt = #line) {
        if !element.exists {
            recordFailure(withDescription: "Expected \(element) to exist", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    // Removing the .resume() from this function makes it fail to follow with the first bug
    func testCreateThreadOnServer() {
        
        let baseURL = URL(string:"https://demomsg-e18e6.firebaseio.com/")!
        let id = UUID().uuidString
        
        let requestURL = baseURL.appendingPathComponent(id).appendingPathExtension("json")
        var request = URLRequest(url: requestURL)
        request.httpMethod = "PUT"
        
        var value = ""
        let didFinish = expectation(description: "didFinish")
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            didFinish.fulfill()
            value = "value"
        }.resume()
        
        wait(for: [didFinish], timeout: 5)
        XCTAssertEqual("value", value)
    }
    
    func testFetchDataFromServer() {
        
        let didFinish = expectation(description: "didFinish")
        
        var messageThreads: [MessageThread] = []
        
        mockController.fetchMessageThreads {
            didFinish.fulfill()
            messageThreads = self.mockController.messageThreads
        }
        wait(for: [didFinish], timeout: 10)
        XCTAssertNotNil(messageThreads)
    }
}
