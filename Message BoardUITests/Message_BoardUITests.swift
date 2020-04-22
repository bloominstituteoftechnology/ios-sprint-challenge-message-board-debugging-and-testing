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
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var createThreadField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    private var enterNameField: XCUIElement {
        return app.textFields["MessageDetailViewController.NameTextField"]
    }
    
    
    private var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    func testCreateThread(){
        createThreadField.tap()
        
        app.typeText("testThread")
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.tables.staticTexts["testThread"].exists)
        
        app.tables.staticTexts["testThread"].tap()
        XCTAssert(app.navigationBars["testThread"].exists)
        app.navigationBars["testThread"].buttons["λ Message Board"].tap()
        XCTAssert(app.tables.staticTexts["testThread"].exists)
        
        
    }
    
    func testCreateMessage(){
        createThreadField.tap()
        
        app.typeText("testThread")
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.tables.staticTexts["testThread"].exists)
        
        app.tables.staticTexts["testThread"].tap()
        XCTAssert(app.navigationBars["testThread"].exists)
        
        app.navigationBars["testThread"].buttons["Add"].tap()
        
        
        enterNameField.tap()
        app.typeText("Person")
        XCTAssert(app.textFields["Person"].exists)
        
        messageTextView.tap()
        app.typeText("Hello")
        XCTAssert(app.textViews["Hello"].exists)
        
        app.navigationBars["New Message"].buttons["Send"].tap()
        app.navigationBars.buttons["testThread"].tap()
        XCTAssert(app.tables.staticTexts["Person"].exists)
   
}
  
}
