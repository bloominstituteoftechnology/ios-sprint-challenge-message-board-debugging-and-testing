//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testSegueToMessageBoard() {
        // Test if it segues to the correct message board
        // Compare the title of the tapped cell with the title of the detail view's navigation title
        MessageBoardPage(testCase: self)
        .verifySegueToThread(for: 0)
    }
    
    func testMessageExists() {
        // Click on first thread and check if it has a message
        MessageBoardPage(testCase: self)
        .verifyMessageExists(for: 0)
    }
    
    func testCreateNewMessage() {
        // Click through message board, create new messge, and ten check if the newly created messages name is as expected
        MessageBoardPage(testCase: self)
        .verifyHasAddedNewMessage(for: 0, name: "Billy McTest", message: "Test")
    }
}
