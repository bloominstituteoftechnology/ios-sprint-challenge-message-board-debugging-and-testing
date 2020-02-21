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
    func testBaseURL() {
        XCTAssertEqual(MessageThreadController.baseURL, URL(string: "https://lambda-journal-debug-sprint.firebaseio.com/"))
    }
    
    func encodeMessage() -> Data? {
        let aMessage = ["TestMessage":MessageThread.Message(text: "Hi", sender: "Tester")]
        let encodedMessage = try? JSONEncoder().encode(aMessage.self)
        return encodedMessage
    }
    
    func testEncodeMessage() {
        let aMessage = ["TestMessage":MessageThread.Message(text: "Hi", sender: "Tester")]
        let encodedMessage = try? JSONEncoder().encode(aMessage.self)
        XCTAssertNotNil(encodedMessage)
    }
    
    func testDecodeMessage() {
        let encodedMessage = encodeMessage()
        XCTAssertNotNil(encodedMessage)
        let decodedDummyMessageResult = try! JSONDecoder().decode([String:MessageThread.Message].self, from: encodedMessage!)
        let decodedMessage = decodedDummyMessageResult.map { $0.value }
        XCTAssert(decodedMessage[0].messageText == "Hi")
        XCTAssert(decodedMessage[0].sender == "Tester")
    }
}
