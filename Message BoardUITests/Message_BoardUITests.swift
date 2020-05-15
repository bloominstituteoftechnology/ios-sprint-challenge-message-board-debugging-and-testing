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
    
    func testAddingThread() {
        let app = XCUIApplication()
        let _ = app.tables
        app.textFields.element.tap()
        app.textFields.element.typeText("test")
        XCUIApplication().keyboards.buttons["return"].tap()
    }
    
    func testOpeningThread() {
        let app = XCUIApplication()
        app.tables.children(matching: .cell).element(boundBy: 0).tap()
        app.buttons["λ Message Board"].tap()
    }
    
    func testUsingThread() {
        
        let app = XCUIApplication()
        app.textFields.element.tap()
        app.textFields.element.typeText("test")
        XCUIApplication().keyboards.buttons["return"].tap()
        app.tables.children(matching: .cell).element(boundBy: 2).tap()
        app.navigationBars["test"].buttons["Add"].tap()
        app.textFields.element.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
    }
    
    func testSimpleLifeCycle() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.textFields["Create a new thread:"].tap()
        app.textFields.element.typeText("new")
        XCUIApplication().keyboards.buttons["return"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["new"]/*[[".cells.staticTexts[\"new\"]",".staticTexts[\"new\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["new"].buttons["Add"].tap()
        let enterYourNameTextField = app.textFields["Enter your name:"]
        enterYourNameTextField.tap()
        enterYourNameTextField.tap()
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
    }
    
}
