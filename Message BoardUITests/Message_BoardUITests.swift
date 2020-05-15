//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
 

class Message_BoardUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let  app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
   func testCreatingNewThread() {

       // Empty tableView
       let threadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
       XCTAssertEqual(app.tables.cells.count, 0)

       threadTextField.tap()
       threadTextField.typeText("This is a testing thread.")
       app.keyboards.buttons["Return"].tap()
       XCTAssertEqual(app.tables.cells.count, 1)
   }
}
