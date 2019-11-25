//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    // Bug 2 UI test
    func testThreadsLoadedOnStart() {
        let predicate = NSPredicate(format: "count > 0")
        let fetchedThreadsExpectation = expectation(for: predicate, evaluatedWith: app.tables.cells)
        fetchedThreadsExpectation.expectationDescription = "Threads should have been loaded at start"
        
        waitForExpectations(timeout: 5)
        
    }
    
    // Bug 4 UI test
    func testCreateNewMessage() {
        
        let app = XCUIApplication()
        app.tables.cells.firstMatch.tap()
        app.navigationBars.buttons["Add"].tap()
        let txtName = app.textFields["NewMessageSender"]
        txtName.tap()
        txtName.typeText("Joel")
               
        let txtvMessageBody = app.textViews["NewMessageBody"]
        txtvMessageBody.tap()
        txtvMessageBody.typeText("This is a UI Test message.")
        
        let newMessageNavigationBar = app.navigationBars["New Message"]
        newMessageNavigationBar.buttons["Send"].tap()
        XCTAssertGreaterThan(app.tables.cells.count, 1)
    }
}
