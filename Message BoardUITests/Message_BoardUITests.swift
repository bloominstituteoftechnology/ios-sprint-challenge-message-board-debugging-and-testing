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
    
    func testChangingThreads() {
        
        let table = app.tables
        
        table.staticTexts["A New Thread"].tap()
        let title0 = app.navigationBars.staticTexts.firstMatch.label
        
        app.navigationBars.buttons["λ Message Board"].tap()
        table.staticTexts["Testing again"].tap()
        let title1 = app.navigationBars.staticTexts.firstMatch.label
        
        XCTAssertNotEqual(title0, title1)
        
        app.navigationBars.buttons["λ Message Board"].tap()
        table.staticTexts["A New Thread"].tap()
        let title0a = app.navigationBars.staticTexts.firstMatch.label
        
        XCTAssertEqual(title0, title0a)
    }
    
    func testCreatingThread() {
        
        app.textFields["Create a new thread:"].tap()
        
        app.keys["a"].tap()
        app.buttons["Return"].tap()
        
        app.tables.staticTexts["a"].tap()
        let title = app.navigationBars.staticTexts.firstMatch.label
        XCTAssertEqual(title, "a")
    }
    
}
