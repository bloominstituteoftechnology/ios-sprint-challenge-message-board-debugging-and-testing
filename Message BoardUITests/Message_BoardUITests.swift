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
    
    func testNewMessageThread() {

        let app = XCUIApplication()
        app.launch()
        
        let emptyListTable = app.tables["Empty list"]
        let createANewThreadTextField = emptyListTable.textFields["Create a new thread:"]
        createANewThreadTextField.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Testing"]/*[[".cells.staticTexts[\"Testing\"]",".staticTexts[\"Testing\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        emptyListTable.swipeDown()
        app.navigationBars["Testing"].buttons["λ Message Board"].tap()
        createANewThreadTextField.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Bugs"]/*[[".cells.staticTexts[\"Bugs\"]",".staticTexts[\"Bugs\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Bugs"].buttons["λ Message Board"].tap()
        
    }
    
}
