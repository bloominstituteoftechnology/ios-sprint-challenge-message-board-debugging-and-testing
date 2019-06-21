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

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateNewMessage() {
        
        messageTextfield.tap()
        messageTextfield.typeText("Jason Bourne\n")
        cellAt(0).tap()
        app.navigationBars["Jason Bourne"].buttons["Add"].tap()
        messageDetailTextfield.tap()
        messageDetailTextfield.typeText("Does it work?\n")
        messageDetailTextView.tap()
        messageDetailTextView.typeText("I hope it does.\n")
        app.navigationBars["New Message"].buttons["Send"].tap()
        app.navigationBars.buttons["λ Message Board"].tap()
    }
    
    // MARK: - Actions
    func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.cells.element(boundBy: index)
        return cell
    }
    
    private var messageTextfield: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.Textfield"]
    }
    
    private var messageDetailTextfield: XCUIElement {
        return app.textFields["MessageDetailViewController.Textfield"]
    }
    
    private var messageDetailTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.TextView"]
    }
}
