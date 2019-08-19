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

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateMessageThread() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.textFields["Create a new thread:"].tap()
        
        app.typeText("myNewThread")
        app.keyboards.buttons["Return"].tap()
        XCTAssert(tablesQuery.staticTexts["myNewThread"].exists)
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["myNewThread"]/*[[".cells.staticTexts[\"myNewThread\"]",".staticTexts[\"myNewThread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.navigationBars["myNewThread"].exists)
        app.navigationBars["myNewThread"].buttons["λ Message Board"].tap()
        XCTAssert(app.tables.cells.staticTexts["myNewThread"].exists)
        
    }
    
    
    func testCreateMessage() {
        
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        
        tablesQuery.textFields["Create a new thread:"].tap()
        app.typeText("myNewMessageThread")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssert(tablesQuery.staticTexts["myNewMessageThread"].exists)
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["myNewMessageThread"]/*[[".cells.staticTexts[\"myNewMessageThread\"]",".staticTexts[\"myNewMessageThread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.navigationBars["myNewMessageThread"].exists)
        let mynewmessagethreadNavigationBar = app.navigationBars["myNewMessageThread"]
        mynewmessagethreadNavigationBar.buttons["Add"].tap()
        
        XCTAssert(app.textFields["Enter your name:"].exists)
        let enterYourNameTextField = app.textFields["Enter your name:"]
        enterYourNameTextField.tap()
        app.typeText("Kobe")
        XCTAssert(enterYourNameTextField.value != nil)
        
        let textView = app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        app.typeText("myNewMessage")
        XCTAssert(textView.value != nil)
        
        XCTAssert(app.navigationBars["New Message"].exists)
        let newMessageNavigationBar = app.navigationBars["New Message"]
        newMessageNavigationBar.buttons["Send"].tap()
        newMessageNavigationBar.buttons["myNewMessageThread"].tap()
        XCTAssert(app.tables.cells.staticTexts["Kobe"].exists)

        
    }
    
}
