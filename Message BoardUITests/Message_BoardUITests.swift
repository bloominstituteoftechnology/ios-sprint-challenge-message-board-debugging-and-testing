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
    
    func testSendMessage() {
        
        let app = XCUIApplication()
        app.tables["Empty list"].textFields["Create a new thread:"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["test"]/*[[".cells.staticTexts[\"test\"]",".staticTexts[\"test\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let testNavigationBar = app.navigationBars["test"]
        testNavigationBar.buttons["Add"].tap()
        
        let enterYourNameTextField = app.textFields["Enter your name:"]
        enterYourNameTextField.tap()
        enterYourNameTextField.tap()
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        testNavigationBar.staticTexts["test"].tap()
                
    }
    
}
