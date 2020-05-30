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
        
        let newThread = XCUIApplication().tables["Empty list"].textFields["com.messageboard.createboard"]
        newThread.tap()
        
        newThread.typeText("New Thread\n")
        
        XCTAssert(app.staticTexts["New Thread"].exists)
        }
    
    func testCreatingMessage() {
        let app = XCUIApplication()
        
        // User creates a new thread
        let newThread = app.tables["Empty list"].textFields["com.messageboard.createboard"]
        newThread.tap()
        
        newThread.typeText("Hello\n")
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Hello"]/*[[".cells.staticTexts[\"Hello\"]",".staticTexts[\"Hello\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // User selects the new thread
        let helloNavigationBar = app.navigationBars["Hello"]
        
        // User hits the add button
        helloNavigationBar.buttons["Add"].tap()
        
        // User enters Name
        let nameField = app/*@START_MENU_TOKEN@*/.textFields["com.messageboard.namefield"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"com.messageboard.namefield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nameField.tap()
        nameField.typeText("Claudia")
        
        // User enters a message
        let  messageField = app.textViews["com.messageboard.messagetext"]
        messageField.tap()
        messageField.typeText("Hello again")
        
        // User saves the message
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        XCTAssert(app.staticTexts["Claudia"].exists)
        
        //User goes back to previous viewController
        helloNavigationBar.buttons["λ Message Board"].tap()
        
    }
}
