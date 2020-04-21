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
    
    func testCreateNewThread() {
        app.tables["Empty list"].textFields["Create a new thread:"].tap()
        
    }
    
    func testCreateNewMessage() {
        
        app.tables.children(matching: .cell).element(boundBy: 0).tap()
        app.navigationBars.buttons["Add"].tap()
        app.textViews.staticTexts["messageText"].tap()
        let message = app.textViews.staticTexts["messageText"]
        
        XCTAssertNotNil(message)
    }
    
    func testSenderExists() {
        
        app.tables.children(matching: .cell).element(boundBy: 0).tap()
        app.navigationBars.buttons["Add"].tap()
        app.textFields.staticTexts["sender"].tap()
        
        let sender = app.textFields.staticTexts["sender"]
        XCTAssertNotNil(sender)

    }
}
