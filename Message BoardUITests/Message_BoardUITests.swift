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
    
    func testCreateThread() {
        
        let createANewThreadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        createANewThreadTextField.tap()
        createANewThreadTextField.tap()
        createANewThreadTextField.tap()
        
    }
    
    func testThreadCell() {

        
        let app = XCUIApplication()
        app.tables.staticTexts["A New Thread"].tap()
        app.tables["Checking to make sure this works."]
        app.navigationBars.buttons["λ Message Board"].tap()
//
       
    }
        func testNewMessage() {
        let NavigationBar = app.navigationBars["A New Thread"]
        let newMessageNavigationBar = app.navigationBars["New Message"]
        
        
    }
}
