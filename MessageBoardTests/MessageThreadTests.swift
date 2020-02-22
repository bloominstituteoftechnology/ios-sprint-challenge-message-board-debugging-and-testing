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
    
    //=======================
    // MARK: - Helper Methods
    func encodeMessage() -> Data? {
        let aMessage = ["TestMessage":MessageThread.Message(text: "Hi", sender: "Tester")]
        let encodedMessage = try? JSONEncoder().encode(aMessage.self)
        return encodedMessage
    }
    
    func decodeMessage() -> [MessageThread.Message]? {
        let encodedMessage = encodeMessage()
        XCTAssertNotNil(encodedMessage)
        let decodedDummyMessageResult = try! JSONDecoder().decode([String:MessageThread.Message].self, from: encodedMessage!)
        let decodedMessages = decodedDummyMessageResult.map { $0.value }
        return decodedMessages
    }
    
    //=======================
    // MARK: - Testing
    func testBaseURL() {
        XCTAssertEqual(MessageThreadController.baseURL, URL(string: "https://lambda-journal-debug-sprint.firebaseio.com/"))
    }
    
    func testEncodeMessage() {
        let encodedMessage = encodeMessage()
        XCTAssertNotNil(encodedMessage)
    }
    
    func testDecodeMessage() {
        let decodedMessages = decodeMessage()
        XCTAssertNotNil(decodedMessages)
        XCTAssert(decodedMessages![0].messageText == "Hi")
        XCTAssert(decodedMessages![0].sender == "Tester")
    }
}
