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
    
    private var nameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.NameTextField"]
    }
    
    private var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    private var searchBar: XCUIElement {
        return app.searchFields["MessageThreadsTableViewController.Search"]
    }
    
    func testCreatingNewMessage() {
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Testing again"]/*[[".cells.staticTexts[\"Testing again\"]",".staticTexts[\"Testing again\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Testing again"].buttons["Add"].tap()
        
        messageTextView.tap()
        messageTextView.typeText("Message")
        nameTextField.tap()
        nameTextField.typeText("Sender")
        app.navigationBars["New Message"].buttons["Send"].tap()
    }
    
    func testCreatingMessage() {
        
        searchBar.tap()
        searchBar.typeText("Test")
        searchBar.typeText("\n")
        
        
        
        
        
        
        
        
        
        
        
    }
    
    func testReadingThreads() {
        
        
        
    }
    
    func testReadingMessages() {
        
    }
    
}
