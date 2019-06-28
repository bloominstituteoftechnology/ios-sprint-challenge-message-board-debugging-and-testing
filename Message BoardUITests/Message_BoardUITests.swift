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

    func testCreatingThread() {
        let app = XCUIApplication()
        let threadTextField = app.textFields["Create a new thread:"]
        threadTextField.tap()
        threadTextField.typeText("Testing Another Thread\n")
        let cell = app.tables.cells.staticTexts["Testing Another Thread"]
        XCTAssertEqual(cell.label, "Testing Another Thread")

    }
    
//    func testLoadingThreads() {
//        let app = XCUIApplication()
//
//        let fetchedThreadsExpectation = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.tables.cells, handler: nil)
//
//        fetchedThreadsExpectation.expectationDescription = "Threads should have been fetched and displayed on the table view."
//
//        waitForExpectations(timeout: 4)
//    }
    
    
    
}
