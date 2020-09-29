//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board


class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCancelMessage() {
        try! setUpWithError()
        
        app.tables.staticTexts["A New Thread"].tap()
               let NavigationBar = app.navigationBars["A New Thread"]
               let StaticText = NavigationBar.staticTexts["A New Thread"]
               StaticText.tap()
               NavigationBar.buttons["Add"].tap()
               app.navigationBars["New Message"].buttons["Cancel"].tap()
               StaticText.tap()
               XCTAssertEqual(StaticText.label, "A New Thread")
    }
    
    func testCreateMessage() {
        try! setUpWithError()
        
        
     //   let app = XCUIApplication()
//        app.tables["Empty list"].textFields["Create a new thread:"].tap()
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Glad"]/*[[".cells.staticTexts[\"Glad\"]",".staticTexts[\"Glad\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Glad"].buttons["Add"].tap()
//
//        let enterYourNameTextField = app.textFields["Enter your name:"]
//        enterYourNameTextField.tap()
//        enterYourNameTextField.tap()
//
//        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
//        textView.tap()
//        textView.tap()
//        app.navigationBars["New Message"].buttons["Send"].tap()
//        XCTAssert(app.tables.cells.staticTexts["Glad"].exists)
        
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()
        let nameTextField = app.textFields["Enter your name:"]
        nameTextField.tap()
        nameTextField.typeText("Glad")
        let newMessageTextFieldTextView = app.textViews["newMessageTextField"]
        newMessageTextFieldTextView.tap()
        newMessageTextFieldTextView.typeText("You've got mail.")
        app.navigationBars["New Message"].buttons["Send"].tap()
        XCTAssert(app.tables.cells.staticTexts["Glad"].exists)
    }
    
    func testCreateThread() {
        try! setUpWithError()
        let createThreadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        createThreadTextField.tap()
        createThreadTextField.typeText("For the Alliance!")
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.tables.cells.staticTexts["For the Alliance!"].exists)
    }
}
