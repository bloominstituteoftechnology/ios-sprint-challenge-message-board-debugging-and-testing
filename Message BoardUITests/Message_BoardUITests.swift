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
    
    func testCreatedThreadsLoad() {
        
        // This is failing because of the isUITesting == true, rather than false.
        // Changing to false allows this test to pass.
        let countPredicate = NSPredicate(format: "count > 0")
        let fetchedThreads = expectation(for: countPredicate, evaluatedWith: app.tables.cells)
        
        fetchedThreads.expectationDescription = "Threads should have been loaded at start"
        
        waitForExpectations(timeout: 7)
        
    }
    
}
