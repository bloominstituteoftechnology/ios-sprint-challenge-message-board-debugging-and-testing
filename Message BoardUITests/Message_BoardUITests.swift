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
    
    func testRecordCreateMessageOnThread() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.textFields["Create a new thread:"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["iOS 11 test thread 1"]/*[[".cells.staticTexts[\"iOS 11 test thread 1\"]",".staticTexts[\"iOS 11 test thread 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["iOS 11 test thread 1"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        
    }
    
    // Testing bug 1 and bug 2 and bug 3
    func testCreateLocalMessageOnThread() {
        let messageThread = app.tables.cells.firstMatch
        
        let textField = app.textFields.element
        let textView = app.textViews.element
        
        messageThread.tap()
        app.navigationBars.firstMatch.buttons["Add"].tap()
        textField.tap()
        textField.typeText("UI Test Run")
        textView.tap()
        app.buttons["Send"].tap()
        
        sleep(2)
        XCTAssertTrue(app.tables.cells.count > 1)
    }
}
