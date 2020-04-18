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
        
        // Send button should take us back to MessageThreadDetailTableViewController
        XCTAssertTrue(app.staticTexts[message].exists)

        // TODO: ? This doesn't work because it's in the stack some where.
//        let navBar = app.navigationBars[threadName]
//        XCTAssertNotNil(navBar)
        
        // TODO: ? Why doesn't this work?
//        XCTAssertEqual(navBar.identifier, threadName)
    }
    
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

        // Retreat to MessageThreadsTableViewController
        app.navigationBars[threadName].buttons["λ Message Board"].tap()
        
        /// Bug 0009: Added mock thread is discarded upon return to MessageThreadsTableViewController
        // Verify the thread we created is still there
        XCTAssertTrue(app.tables.cells["2"].exists)
    }

}
