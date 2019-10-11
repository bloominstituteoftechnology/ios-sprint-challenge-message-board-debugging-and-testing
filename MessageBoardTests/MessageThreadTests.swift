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
    
    func testExpectation() {
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://apple.com")!

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "Dave"
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        XCTAssertEqual("Dave", name)
    }
    
    func testAddingThread() {
        let baseURL = URL(string: "https://message-board-sprint-challenge.firebaseio.com/")!
        var messageThreads: [MessageThread] = []
        
        func createMessageThread(with title: String, completion: @escaping () -> Void) {
            
            let thread = MessageThread(title: title)
            
            let requestURL = MessageThreadController.baseURL.appendingPathComponent(thread.identifier).appendingPathExtension("json")
            var request = URLRequest(url: requestURL)
            request.httpMethod = HTTPMethod.put.rawValue
            
            do {
                request.httpBody = try JSONEncoder().encode(thread)
            } catch {
                NSLog("Error encoding thread to JSON: \(error)")
            }
            
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                
                if let error = error {
                    NSLog("Error with message thread creation data task: \(error)")
                    completion()
                    return
                }
                
                messageThreads.append(thread)
                completion()
                
            }.resume()
        }
        
        createMessageThread(with: "Unit Test Adding Thread") {
            XCTAssert(!messageThreads.isEmpty)
        }
    }
    
    
    
}
