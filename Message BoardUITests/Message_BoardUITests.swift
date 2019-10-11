//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
     // MARK: - Helper Properties
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testAddMessageButtonTapped() {
        app.tables.firstMatch.cells.firstMatch.tap()
        app.navigationBars.firstMatch.buttons["MessageThreadDetailTableViewController.addButton"].tap()
        XCTAssertEqual(app.navigationBars.firstMatch.identifier, "New Message")
    }
    
    func testSendMessage() {
        app.tables.firstMatch.cells.firstMatch.tap()
        app.navigationBars.firstMatch.buttons["MessageThreadDetailTableViewController.addButton"].tap()
        XCTAssertEqual(app.navigationBars.firstMatch.identifier, "New Message")
//        app.textFields["MessageDetailViewController.nameTextField"].tap()
//        app.textFields["MessageDetailViewController.nameTextField"].typeText("Testing text field")
//        app.textViews["MessageThreadDetailTableViewController.messageTextView"].tap()
//        app.textViews["MessageThreadDetailTableViewController.messageTextView"].typeText("Testing text view")
    }
}
