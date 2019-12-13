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
    
    private var createThread: XCUIElement {
       
        return app.tables.textFields["Create a new thread:"]
    }
    
    private var senderName: XCUIElement {
        
        return app.textFields["MessageDetailViewController.nameTextField"]
    }
    
    private var messageText: XCUIElement {
        
        return app.textViews["MessageDetailViewController.textView"]
    }
    
    func testIfThreadsWereFetched(){
       
        XCTAssert(app.tables.cells.count > 0)
    }
    
    func testExistingCells(){
        
        XCTAssert(app.tables.cells.element.exists)
    }
    
    func testCreatingMessageThread(){
       
        let cell = app.tables.staticTexts["Testing again"]
        XCTAssertEqual(cell.label, "Testing again")
    }
    
    func testNavigationBarChangeFromCell(){
      
        let title = app.navigationBars["λ Message Board"]
        XCTAssert(title.waitForExistence(timeout: 4))
        
        let cell = app.tables.staticTexts["Testing again"]
        cell.tap()
        
        let newTitle = app.navigationBars["Testing again"]
        XCTAssert(newTitle.waitForExistence(timeout: 3))
        app.navigationBars["Testing again"].buttons["Add"].tap()
        let textField = app.textFields.containing(.textField, identifier: "MessageDetailViewController.nameTextField")
        XCTAssertNotNil(textField)
    }
    
    func testCreatingThread() {
       
        createThread.tap()
        createThread.typeText("Another Test")
        app.keyboards.buttons["Return"].tap()
        XCTAssertTrue(app.tables.staticTexts["Another Test"].exists)
    }
    
    func testCreatingMessage() {
        
        createThread.tap()
        createThread.typeText("Another Test")
        app.keyboards.buttons["Return"].tap()
        
        let thread = app.tables.staticTexts["Another Test"]
        XCTAssertTrue(thread.exists)
        
        thread.tap()
        app.navigationBars.buttons["Add"].tap()
        
        senderName.tap()
        senderName.typeText("Jerry")
        
        messageText.tap()
        messageText.typeText("This is another test.")
        
        app.navigationBars.buttons["Send"].tap()
        
        let message = app.tables.staticTexts["This is another test."]
        XCTAssertTrue(message.exists)
    }
    
}
