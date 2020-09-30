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
    
    private var firstRow: XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: 0)
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateNewThread() {
        try! setUpWithError()
        
        let createTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        createTextField.tap()
        createTextField.typeText("A New Thread")
        app.keyboards.buttons["return"].tap()
        XCTAssert(app.tables.cells.staticTexts["A New Thread"].exists)
    }
    
    
    func testCheckThreadMessages() {
        try! setUpWithError()
        
        
        firstRow.tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.textFields["Enter your name:"].typeText("Bohdan")
        app.navigationBars["New Message"].buttons["Send"].tap()
        XCTAssert(app.tables.cells.staticTexts["Bohdan"].exists)
    }
    
    func testThreadMessage() {
        XCTAssert(app.staticTexts["A New Thread"].exists)
        app.staticTexts["A New Thread"].tap()
        XCTAssert(app.staticTexts["Bohdan"].exists)
    }
    
    
}




