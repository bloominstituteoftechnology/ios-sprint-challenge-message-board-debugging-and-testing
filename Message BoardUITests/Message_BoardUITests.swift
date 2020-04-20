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
    
    func testCreatingThread() {
        
        let createThreadName = XCUIApplication().tables.textFields["Create a new thread:"]
        
        XCTAssertEqual(app.tables.cells.count, 0)
        
        createThreadName.tap()
        createThreadName.typeText("Test UI Thread")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertEqual(app.tables.cells.count, 1)
   }
    
    func testAccessingNewMessageView() {

        let createThreadName = XCUIApplication().tables.textFields["Create a new thread:"]
        createThreadName.tap()
        createThreadName.typeText("TestingUI")
        app.keyboards.buttons["Return"].tap()
        
        app.staticTexts["TestingUI"].tap()
        app.navigationBars["TestingUI"].buttons["Add"].tap()
        
        XCTAssertEqual(app.navigationBars.staticTexts.firstMatch.label, "New Message")
                
    }
    
}
