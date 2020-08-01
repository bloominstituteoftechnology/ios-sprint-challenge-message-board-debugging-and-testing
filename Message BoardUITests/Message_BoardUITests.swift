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
    
    func testCreateNewThread() {
        try! setUpWithError()
        let createTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        createTextField.tap()
        createTextField.typeText("UI Test 1")
        
        app.keyboards.buttons["return"].tap()
        XCTAssert(app.tables.cells.staticTexts["UI Test 1"].exists)
    }
    
    func testCreateNewMessage() {
        try! setUpWithError()
        
        app.tables.staticTexts["A New Thread"].tap()
    }
    
    func testCheckThreadMessages() {
        try! setUpWithError()
        XCUIApplication().tables.children(matching: .cell).element(boundBy: 0).staticTexts["Unit Test 1"].tap()
        
    }
}
