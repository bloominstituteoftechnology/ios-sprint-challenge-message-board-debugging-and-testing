//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - Helper Prorperties
    
    var app: XCUIApplication!
    
    // MARK: - Test Setup

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Tests
    
    func testSaveButtonInMessageDetail() throws {
        
        // Create a new thread
        app.textFields["ThreadsTV.CreateTextField"].tap()
        app.textFields["ThreadsTV.CreateTextField"].typeText("New Entry")
        app.keyboards.buttons["Return"].tap()

        // Tap the cell we just added
        app.tables.cells["2"].tap()
        
        // Advance to MessageThreadDetailTableViewController
        app.buttons["Add"].tap()
        
        // Advance to MessageDetailViewController
        app.textFields["DetailVC.NameTextField"].tap()
        app.textFields["DetailVC.NameTextField"].typeText("Dennis")

        app.textViews["DetailVC.MessageTextView"].tap()
        app.textViews["DetailVC.MessageTextView"].typeText("Hello, world!")

        app.buttons["Send"].tap()
        
        //tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["a"]/*[[".cells.staticTexts[\"a\"]",".staticTexts[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Send button should take us back to MessageThreadDetailTableViewController
        let foundText = app.staticTexts["Hello, world!"]
        XCTAssertNotNil(foundText)

        // TODO: ? This doesn't work because it's in the stack some where.
//        let navBar = app.navigationBars["New Entry"]
//        XCTAssertNotNil(navBar)
        
        // TODO: ? Why doesn't this work?
//        XCTAssertEqual(navBar.identifier, "New Entry")
    }
    
    // Find the broken segue. Bug 0002
    func testUIRoundTrip() throws {
                
        let threadName = "New Entry"
        let name = "Dennis"
        let message = "Hello, world!"
        
        // Create a new thread
        app.textFields["ThreadsTV.CreateTextField"].tap()
        app.textFields["ThreadsTV.CreateTextField"].typeText(threadName)
        app.keyboards.buttons["Return"].tap()

        // Tap the cell we just added
        app.tables.cells["2"].tap()
        
        // Advance to MessageThreadDetailTableViewController
        app.buttons["Add"].tap()
        
        // Advance to MessageDetailViewController
        app.textFields["DetailVC.NameTextField"].tap()
        app.textFields["DetailVC.NameTextField"].typeText(name)

        app.textViews["DetailVC.MessageTextView"].tap()
        app.textViews["DetailVC.MessageTextView"].typeText(message)

        app.buttons["Send"].tap()

        // Retreat to
        app.navigationBars[threadName].buttons["λ Message Board"].tap()
    }

}
