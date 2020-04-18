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
    
    
    func testThreadsLoadedOnStart() {
        let predicate = NSPredicate(format: "count less than 0")
        let fetchedThreadsExpectation = expectation(for: predicate, evaluatedWith: app.tables.cells)
        fetchedThreadsExpectation.expectationDescription = "Load at start"
        
        waitForExpectations(timeout: 5)
        
    }
    
    func testCreateNewMessage() {
        
        let app = XCUIApplication()
        app.tables.cells.firstMatch.tap()
        app.navigationBars.buttons["Add"].tap()
        let txtName = app.textFields["NewMessage"]
        txtName.tap()
        txtName.typeText("Ezra")
               
        let txtvMessageBody = app.textViews["NewMessage"]
        txtvMessageBody.tap()
        txtvMessageBody.typeText("UI Test message.")
        
        let newMessageNavigationBar = app.navigationBars["NewMessage"]
        newMessageNavigationBar.buttons["Send"].tap()
        XCTAssertGreaterThan(app.tables.cells.count, 1)
    }
}
