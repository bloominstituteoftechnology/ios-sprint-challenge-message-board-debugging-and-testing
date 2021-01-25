//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    var app: XCUIApplication! = nil
    
    override func setUpWithError() throws {
        continueAfterFailure = false
//        app.launchArguments = ["UITesting"]
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    
    func testUIRecording() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Create a new thread:"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sammy’s Test 3"]/*[[".cells.staticTexts[\"Sammy’s Test 3\"]",".staticTexts[\"Sammy’s Test 3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sammy’s Test 3"].buttons["Add"].tap()
        
        let enterYourNameTextField = app.textFields["Enter your name:"]
        enterYourNameTextField.tap()
        enterYourNameTextField.tap()
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
//        textView.tap()
//        textView.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
 
    }
    
    
    
    func testCreateNewThread() {
        app.tables.staticTexts["Create a new thread:"].tap()
    }
    
    func testSegueCreateNewThreadView() {
        app.tables.staticTexts["Create a new thread:"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Sammy’s Test 3"]/*[[".cells.staticTexts[\"Sammy’s Test 3\"]",".staticTexts[\"Sammy’s Test 3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testSendButton() {
        app.tables.staticTexts["Create a new thread:"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Sammy’s Test 3"]/*[[".cells.staticTexts[\"Sammy’s Test 3\"]",".staticTexts[\"Sammy’s Test 3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.navigationBars["Sammy’s Test 3"].buttons["Add"].tap()
        
        let enterYourNameTextField = app.textFields["Enter your name:"]
        enterYourNameTextField.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
    }
    
    func testCancelMessage() {
        try! setUpWithError()
        
        app.tables.staticTexts["Create a new thread:"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Sammy’s Test 3"]/*[[".cells.staticTexts[\"Sammy’s Test 3\"]",".staticTexts[\"Sammy’s Test 3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.navigationBars["Sammy’s Test 3"].buttons["Add"].tap()
        
        let enterYourNameTextField = app.textFields["Enter your name:"]
        enterYourNameTextField.tap()
        app.navigationBars["New Message"].buttons["Cancel"].tap()
    }
    
    
    
}
