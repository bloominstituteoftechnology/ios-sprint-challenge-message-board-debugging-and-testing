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
    
    func testCreateThread() {
        app.launch()
        
        let createANewThreadTextField = app.tables.textFields["Create a new thread:"]
        
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("New thread")
        app.buttons["Return"].tap()
        app.tables.staticTexts["New thread"].tap()
        app.navigationBars["New thread"].buttons["λ Message Board"].tap()
        
    }
    
}
