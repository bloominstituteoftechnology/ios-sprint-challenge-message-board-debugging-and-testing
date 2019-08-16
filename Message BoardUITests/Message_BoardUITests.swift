//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
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
        let textField = app.textFields.containing(.textField, identifier: "MessageDetailViewController.EnterYourNameTextField")
        XCTAssertNotNil(textField)
    }
    
    func testAddMessageBarButtonPressed(){
        let app = XCUIApplication()
        let title = app.navigationBars["λ Message Board"]
        XCTAssert(title.waitForExistence(timeout: 4))
        
        let cell = app.tables.staticTexts["Testing again"]
        cell.tap()
       
        let newTitle = app.navigationBars["Testing again"]
        XCTAssert(newTitle.waitForExistence(timeout: 4))

        app.navigationBars["Testing again"].buttons["Add"].tap()
        
        let textField = app.textFields.containing(.textField, identifier: "MessageDetailViewController.EnterYourNameTextField")
        let textView = app.textViews.containing(.textView, identifier: "MessageDetailViewController.TextView")
        XCTAssertNotNil(textField)
        XCTAssertNotNil(textView)
    }
    
}
