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
    
    // MARK: - Helper Properties
    
    var messageThreadController = MessageThreadController()
    
    func testFirebaseURL() {
        XCTAssertEqual("https://sprintchallenge-week10.firebaseio.com/", "\(messageThreadController.baseURL)")
    }
    
    func testDecodingData() {
        do {
            let dataURL = Bundle.main.url(forResource: "MockMessages", withExtension: "json")!
            let data = try Data(contentsOf: dataURL)
            let result = Array(try JSONDecoder().decode([String: MessageThread].self, from: data).values)
            XCTAssertNoThrow(result)
        } catch {
            NSLog("Error")
        }
        
        do {
            let badDataURL = Bundle.main.url(forResource: "BadMockData", withExtension: "json")!
            let badData = try Data(contentsOf: badDataURL)
            let badDataResult = Array(try JSONDecoder().decode([String: MessageThread].self, from: badData).values)
            XCTAssertThrowsError(badDataResult)
        } catch {
            NSLog("Error")
        }
    }
    
    func testDisplayCreateNewMessage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let display = storyboard.instantiateViewController(withIdentifier: "MessageDetailStoryboardID") as! MessageDetailViewController
        let _ = display.view
        XCTAssertEqual("Enter your name:", display.senderNameTextField!.placeholder!)
    }
}
