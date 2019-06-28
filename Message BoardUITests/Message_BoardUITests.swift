//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testToSeeIfMessageThreadsWereFetched(){
        XCTAssert(app.tables.cells.count > 0)
    }
    
    func testForExistingCells(){
        XCTAssert(app.tables.cells.element.exists)
    }
    
    func testCreatingMessageThread(){
        let cell = app.tables.staticTexts["Testing again"]
        XCTAssertEqual(cell.label, "Testing again")
    }
    
    //this is weird, you have to manually do it for some reason./ Don't press send though.
    func testSendButtonPressed(){
        let sendNaviagion = app.navigationBars["New Message"]
        XCTAssert(sendNaviagion.waitForExistence(timeout: 4))
        
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        let newTitle = app.navigationBars["Testing again"]
        XCTAssert(newTitle.waitForExistence(timeout: 1))
        
    }
    
    func testNavigationBarChangeFromCell(){
        let title = app.navigationBars["λ Message Board"]
        XCTAssert(title.waitForExistence(timeout: 3))
        
        let cell = app.tables.staticTexts["Testing again"]
        cell.tap()
        
        //check the New navigationBar title
        let newTitle = app.navigationBars["Testing again"]
        XCTAssert(newTitle.waitForExistence(timeout: 3))
        app.navigationBars["Testing again"].buttons["Add"].tap()
        let textField = app.textFields.containing(.textField, identifier: "MessageDetailViewController.EnterYourNameTextField")
        XCTAssertNotNil(textField)
    }
    
    func testAddMessageBarButtonPressed(){
        let title = app.navigationBars["λ Message Board"]
        XCTAssert(title.waitForExistence(timeout: 3))
        
        let cell = app.tables.staticTexts["Testing again"]
        cell.tap()
        
        //check the New navigationBar title
        let newTitle = app.navigationBars["Testing again"]
        XCTAssert(newTitle.waitForExistence(timeout: 3))
        
        //tap the ADD bar button
        app.navigationBars["Testing again"].buttons["Add"].tap()
        
        let textField = app.textFields.containing(.textField, identifier: "MessageDetailViewController.EnterYourNameTextField")
        let textView = app.textViews.containing(.textView, identifier: "MessageDetailViewController.TextView")
        XCTAssertNotNil(textField)
        XCTAssertNotNil(textView)
    }
    
}
