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
        
        let createANewThreadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("Pebbles\n")
        
    }
    
    
    func testCreateMessage2ndAttempt() {
        
        // reinvents the wheel
        let app = XCUIApplication()
        let tablesQuery = app.tables
        // repeats the create new message thread test, but it's the only way
        let createANewThreadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("Pebbles\n")
        
        // taps on cell with "Pebbles" which should work bc we just created it
        tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Pebbles"].tap()
        
        // tap plus button
        app.navigationBars["Pebbles"].buttons["Add"].tap()
        
        // fill out two fields for a message; hit "Send"
        app.textFields["Enter your name:"].tap()
        app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
 
    }
    
    func testEverythingUI() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let createANewThreadTextField = tablesQuery.textFields["Create a new thread:"]
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("Pebbles\n")
        
        app.tables.cells["messageThread.cell"].tap()
        
        
        let pebblesNavigationBar = app.navigationBars["Pebbles"]
        pebblesNavigationBar.buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        let writingStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Writing"]/*[[".cells.staticTexts[\"Writing\"]",".staticTexts[\"Writing\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        writingStaticText.tap()
        writingStaticText.tap()
        writingStaticText.tap()
        pebblesNavigationBar.buttons["λ Message Board"].tap()
        createANewThreadTextField.tap()
        
        
    }
    
    func testCreateMessage() {
        
        let app = XCUIApplication()
        let createANewThreadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("Pebbles")
        
        //use of unresolved identifier 'app'.  WHAT THE FUCK???
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Pebbles"]/*[[".cells.staticTexts[\"Pebbles\"]",".staticTexts[\"Pebbles\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Pebbles"].buttons["Add"].tap()
//        app.textFields["Enter your name:"].tap()
//        app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
//        app.navigationBars["New Message"].buttons["Send"].tap()

        
        //senderField.typeText("Jack Nicklaus")
        
    }
}
