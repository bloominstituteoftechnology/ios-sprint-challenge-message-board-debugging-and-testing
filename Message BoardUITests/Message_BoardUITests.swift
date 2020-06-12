//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Test to create new thread on first table controller & show it on cell
    func testCreateMessageThread() {
         let messageTextField = app.tables.textFields["Create a new thread:"]
         messageTextField.tap()
         messageTextField.typeText("testy test test")
         app.keyboards.buttons["Return"].tap()

         XCTAssertTrue(app.tables.staticTexts["testy test test"].exists)
     }
    
    
    
    
}
