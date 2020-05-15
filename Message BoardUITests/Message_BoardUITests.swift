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
    
    func test() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.textFields["Create a new thread:"].tap()
        tablesQuery.children(matching: .cell).element(boundBy: 8).staticTexts["hi"].tap()
        app.navigationBars["hi"].buttons["λ Message Board"].tap()
        
    }
    
}
