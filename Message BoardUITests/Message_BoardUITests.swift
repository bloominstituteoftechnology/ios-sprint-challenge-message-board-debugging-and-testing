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
        
   
        
        func testAddingThread() {
            
            let newThreadCell = XCUIApplication().tables.textFields["Create a new thread:"]
            
            XCTAssertEqual(app.tables.cells.count, 2)
            
            newThreadCell.tap()
            newThreadCell.typeText("A New, New Thread")
            app.keyboards.buttons["Return"].tap()
            
            XCTAssertEqual(app.tables.cells.count, 3)
        }
    }
