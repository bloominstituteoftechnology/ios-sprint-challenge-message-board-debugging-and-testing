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
    
    func testCreatingMessage() {
        
        app.tables.staticTexts["A New Thread"].tap()
        app.buttons["Add"].tap()
        
        app.textFields["Enter your name:"].tap()
        app.buttons["Send"].tap()
        
        XCTAssertEqual(app.navigationBars.staticTexts.firstMatch.label, "A New Thread")
    }
    
    func testInitial() {
        let app = XCUIApplication()
        XCTAssertTrue(app.tables.cells.count > 0)
    }
    
}
