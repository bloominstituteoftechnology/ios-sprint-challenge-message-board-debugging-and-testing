//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateThread() {
        
        let createANewThreadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("Pebbles")
        
    }
    
    func testCreateMessage() {
        
        let createANewThreadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("Pebbles")


 //       app.tables/*@START_MENU_TOKEN@*/.staticTexts["Pebbles"]/*[[".cells.staticTexts[\"Pebbles\"]",".staticTexts[\"Pebbles\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Pebbles"].buttons["Add"].tap()
//        app.textFields["Enter your name:"].tap()
//        app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
//        app.navigationBars["New Message"].buttons["Send"].tap()

        
        //senderField.typeText("Jack Nicklaus")
        
    }
}
