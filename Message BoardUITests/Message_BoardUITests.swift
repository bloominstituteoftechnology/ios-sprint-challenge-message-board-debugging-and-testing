//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    private var createThread: XCUIElement {
        let app = XCUIApplication()
        return app.tables.textFields["Create a new thread:"]
    }
    
    private var senderName: XCUIElement {
        let app = XCUIApplication()
        return app.textFields["MessageDetailViewController.nameTextField"]
    }
    
    private var messageText: XCUIElement {
        let app = XCUIApplication()
        return app.textViews["MessageDetailViewController.textView"]
    }
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testIfThreadsWereFetched(){
        let app = XCUIApplication()
        XCTAssert(app.tables.cells.count > 0)
    }
    
    func testExistingCells(){
        let app = XCUIApplication()
        XCTAssert(app.tables.cells.element.exists)
    }
    
    func testCreatingMessageThread(){
        let app = XCUIApplication()
        let cell = app.tables.staticTexts["Testing again"]
        XCTAssertEqual(cell.label, "Testing again")
    }
    
    func testNavigationBarChangeFromCell(){
        let app = XCUIApplication()
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
        let app = XCUIApplication()
        createThread.tap()
        createThread.typeText("Another Test")
        app.keyboards.buttons["Return"].tap()
        XCTAssertTrue(app.tables.staticTexts["Another Test"].exists)
    }
    
    func testCreatingMessage() {
        let app = XCUIApplication()
        createThread.tap()
        createThread.typeText("Another Test")
        app.keyboards.buttons["Return"].tap()
        
        let thread = app.tables.staticTexts["Another Test"]
        XCTAssertTrue(thread.exists)
        
        thread.tap()
        app.navigationBars.buttons["Add"].tap()
        
        senderName.tap()
        senderName.typeText("Kat")
        
        messageText.tap()
        messageText.typeText("This is another test.")
        
        app.navigationBars.buttons["Send"].tap()
        
        let message = app.tables.staticTexts["This is another test."]
        XCTAssertTrue(message.exists)
    }
    
}
