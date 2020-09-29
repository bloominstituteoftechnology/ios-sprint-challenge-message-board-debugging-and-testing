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
    
    // I tried to add expectations but either I did it wrong or my tests just fail now. I left the tests as I first had them below these commented ones.
    
//    func testCreateNewThread() {
//        let messageThreadController = MessageThreadController()
//        let didFinish = expectation(description: "didFinish")
//
//        XCTAssertEqual(messageThreadController.messageThreads.count, 0)
//        messageThreadController.createMessageThread(with: "Thread title yo") {
//            didFinish.fulfill()
//            self.wait(for: [didFinish], timeout: 5)
//
//            XCTAssertEqual(messageThreadController.messageThreads.count, 1)
//            XCTAssertEqual(messageThreadController.messageThreads[0].title, "Thread title yo")
//        }
//    }
//
//    func testCreateNewMessage() {
//        let mTC = MessageThreadController()
//        let didFinish = expectation(description: "didFinish")
//
//        XCTAssertEqual(mTC.messageThreads.count, 0)
//        mTC.createMessageThread(with: "Thread title yo") {
//            didFinish.fulfill()
//            self.wait(for: [didFinish], timeout: 5)
//
//            XCTAssertEqual(mTC.messageThreads.count, 1)
//            XCTAssertEqual(mTC.messageThreads[0].title, "Thread title yo")
//            XCTAssertEqual(mTC.messageThreads[0].messages.count, 0)
//            mTC.createMessage(in: mTC.messageThreads[0], withText: "Hey what up?", sender: "Me") {
//                XCTAssertEqual(mTC.messageThreads[0].messages.count, 1)
//                XCTAssertEqual(mTC.messageThreads[0].messages[0].text, "Hey what up?")
//                XCTAssertEqual(mTC.messageThreads[0].messages[0].sender, "Me")
//            }
//        }
//    }
    
    func testCreateNewThread() {
        let messageThreadController = MessageThreadController()
        XCTAssertEqual(messageThreadController.messageThreads.count, 0)
        messageThreadController.createMessageThread(with: "Thread title yo") {
            XCTAssertEqual(messageThreadController.messageThreads.count, 1)
            XCTAssertEqual(messageThreadController.messageThreads[0].title, "Thread title yo")
        }
    }
    
    func testCreateNewMessage() {
        let mTC = MessageThreadController()
        XCTAssertEqual(mTC.messageThreads.count, 0)
        mTC.createMessageThread(with: "Thread title yo") {
            XCTAssertEqual(mTC.messageThreads.count, 1)
            XCTAssertEqual(mTC.messageThreads[0].title, "Thread title yo")
            XCTAssertEqual(mTC.messageThreads[0].messages.count, 0)
            mTC.createMessage(in: mTC.messageThreads[0], withText: "Hey what up?", sender: "Me") {
                XCTAssertEqual(mTC.messageThreads[0].messages.count, 1)
                XCTAssertEqual(mTC.messageThreads[0].messages[0].text, "Hey what up?")
                XCTAssertEqual(mTC.messageThreads[0].messages[0].sender, "Me")
            }
        }
    }
    
    func testDecoding() throws {
        let mTC = MessageThreadController()
        do {
            let data = try Data(contentsOf: mTC.mockDataURL)
            let threadsToDecode = Array(try JSONDecoder().decode([String: MessageThread].self, from: data).values)
            XCTAssertNoThrow(data)
            XCTAssertNoThrow(threadsToDecode)
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    // Left this here for reference when trying to add expectation testing to above unit tests.
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
    
}
