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
    
    // MARK: - UI Testing: Datatask was not started
    func testUIMessageThreadsCreated() {
        // Test the cell text is the thread title
        
    }
    
    // MARK: - UI Testing: Fetched messages not decoded before saving
    func testUIFetchingMessages() {
        // Test that the cell text is the fetched message title
    }
    
    // Mark: -UI Testing: Test the Add thread 
        
    
}
