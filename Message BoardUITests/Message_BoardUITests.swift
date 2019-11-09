//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    let messageThreadController = MessageThreadController()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func tableView(id: String) -> XCUIElement {
        let tableView = app.tables[id]
        XCTAssertTrue(app.tables[id].exists)
        return tableView
    }
    
    func testCreateMessageThread() {
        
        let searchTextField = app.textFields["CreateThread"]
        let testThreadText = "UI Test Thread 1"
        searchTextField.tap()
        searchTextField.typeText(testThreadText)
        
        messageThreadController.createLocalMessageThread(with: testThreadText) {
            print("UI Testing thread creation succeeded!")
        }
    }
    
}
