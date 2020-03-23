//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

enum Result<T> {
    case success(T)
    case error
}

//enum Json {
//    case object(_: Jsono)
//}
//
//protocol NetworkRequest {
//    func request(URL: URL, method: HTTPMethod, competion: @escaping (Result<Json>) -> Void) -> Void
//}

class MessageThreadTests: XCTestCase {
    
    let messageThreadController = MessageThreadController()
    
    func testFetchMessageThreads() {
        XCTAssertNoThrow(testGetDataTask)
        //        testFetchDataTask()
    }
    
    func testGetDataTask() {
//        var thrownError: Error?
        
        let expectation = XCTestExpectation(description: "Waiting for network")
        URLSession.shared.dataTask(with:  Keys.baseURL.appendingPathComponent("json")) { (data, _, error) in
            XCTAssertNotNil(data)
            XCTAssertGreaterThan(data!.count, 100)
            XCTAssertNil(error)
            expectation.fulfill()
        }.resume()
        wait(for: [expectation], timeout: 10)
        
    }
    
    func testPostDataTask() {
        let expectation = XCTestExpectation(description: "Waiting for network")
        
        let messageThread = MessageThread(title: "Test")
        XCTAssertNotNil(messageThread.identifier)
        let requestURL = Keys.baseURL.appendingPathComponent(messageThread.identifier)
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            XCTAssertNotNil(data)
            XCTAssertGreaterThan(data!.count, 100)
            XCTAssertNil(error)
            expectation.fulfill()
        }.resume()
        wait(for: [expectation], timeout: 10)
    }
    
    func testCreateMessageThread() {
        
        XCTAssertNotNil(messageThreadController.messageThreads)
    }
}

//extension XCTestCase {
//    func assert<T>(_ result: Result<T>?,
//                   containsError expectedError: Error,
//                   in file: StaticString = #file,
//                   line: UInt = #line) {
//        switch result {
//        case .success?:
//            XCTFail("No error thrown",
//                    file: file,
//            line: line)
//        case .failure(let error)?:
//            XCTAssertTrue(error)
//        case .nil:
//            XCTFail("Result was nil",
//                    file: file,
//                    line: line)
//        }
//    }
