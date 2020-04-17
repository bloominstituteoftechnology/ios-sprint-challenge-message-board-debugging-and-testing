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
        app.launchArguments.append("UITesting")
        app.launch()
    }
    
    func testCreateThread() {
        app.launch()
        let createANewThreadTextField = app.tables.textFields["Create a new thread:"]
        
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("New thread")
        app.buttons["Return"].tap()
        app.tables.staticTexts["New thread"].tap()
        app.navigationBars["New thread"].buttons["λ Message Board"].tap()
        
    }
    
    func testCreateMessage() {
        app.launch()
        testCreateThread()
        
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["thread"]/*[[".cells.staticTexts[\"thread\"]",".staticTexts[\"thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
        let nameField = app.textFields["EnterName.TextField"]
        let messageView = app.textViews["EnterMessage.TextView"]
        app.tables.cells.element(boundBy: 0).tap()
        app.navigationBars.buttons["Add"].tap()
        nameField.tap()
        // Without waiting app tries to start writing before simulator loads keyboard
//        sleep(1)
        nameField.typeText("Name here")
        messageView.tap()
        messageView.typeText("Name")
        app.navigationBars.buttons["Send"].tap()
        let newMessage = app.tables.cells.element(boundBy: 0)
        XCTAssertNotNil(newMessage)
        
                
        
    }
    
}
