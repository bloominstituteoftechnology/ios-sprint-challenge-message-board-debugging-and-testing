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
    
    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.TurnLabel"]
    }

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
        app.tables.cells["0"].tap()
        
        // Advance to MessageThreadDetailTableViewController
        app.buttons["Add"].tap()
        
        // Advance to MessageDetailViewController
        app.textFields["DetailVC.NameTextField"].tap()
        app.textFields["DetailVC.NameTextField"].typeText("Dennis")

        app.textViews["DetailVC.MessageTextView"].tap()
        app.textViews["DetailVC.MessageTextView"].typeText("Hello, world!")

        app.buttons["Send"].tap()
    }
    
}
