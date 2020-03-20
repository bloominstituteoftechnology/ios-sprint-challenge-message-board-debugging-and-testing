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
    
    
    func testFetchDataTask() {
        
        let expectation = XCTestExpectation(description: "Waiting for network")
        URLSession.shared.dataTask(with:  MessageThreadController.baseURL.appendingPathComponent("json")) { (data, _, error) in
          XCTAssertNotNil(data)
          XCTAssertGreaterThan(data!.count, 100)
          XCTAssertNil(error)
          expectation.fulfill()
        }.resume()
        wait(for: [expectation], timeout: 10)
    }
    
}
