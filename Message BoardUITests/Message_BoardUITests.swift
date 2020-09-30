//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    func testCreateNewThread() {
        try! setUpWithError()
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Create a new thread:"]/*[[".textFields[\"Create a new thread:\"]",".textFields[\"MessageThreadTableViewController.TextField\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.textFields["Create a new thread:"].typeText("new thread")
        
        
        
        app.keyboards.buttons["return"].tap()
        XCTAssert(app.tables.cells.staticTexts["new thread"].exists)
        
        
    }
    
    func testCreateNewMessage() {
        
        try! setUpWithError()
        let app = XCUIApplication()
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.textFields["Enter your name:"].typeText("John")
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("John again")
        app.navigationBars["New Message"].buttons["Send"].tap()
        XCTAssert(app.tables.cells.staticTexts["John"].exists)
               
    }
}
