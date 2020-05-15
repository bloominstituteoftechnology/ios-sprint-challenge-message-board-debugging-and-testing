//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication {
        XCUIApplication()
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
        
        //Make a thread
        
        
    }
    
    func testExample() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
    }
    
    
    
}
