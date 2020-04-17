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
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://ios-albums-ff76b.firebaseio.com/")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                do {
                    let threads = try JSONDecoder().decode([MessageThread].self, from: data)
                    didFinish.fulfill()
                    name = "Dave"
            } catch {
                
                NSLog("Error decoding message threads from JSON data: \(error)")
                }
            }
            
        }.resume()
        
        wait(for: [didFinish], timeout: 10)
        
        XCTAssertEqual(name, "Dave")
        
    }
    
}
