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
}
