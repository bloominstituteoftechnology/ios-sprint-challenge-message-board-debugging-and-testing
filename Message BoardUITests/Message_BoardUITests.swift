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
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.textFields["Create a new thread:"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["fruit"]/*[[".cells.staticTexts[\"fruit\"]",".staticTexts[\"fruit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["fruit"].buttons["Add"].tap()
        
        let enterYourNameTextField = app.textFields["Enter your name:"]
        enterYourNameTextField.tap()
        enterYourNameTextField.tap()
        
        let textView = app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        
    }
}
