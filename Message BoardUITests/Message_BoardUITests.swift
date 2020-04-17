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
        return app.textFields["MessageThreadsTableViewController.Search"]
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
    
    func testCreatingNewThread() {
        searchBar.tap()
        searchBar.typeText("New Thread\n")
    }
    
    func testReadingThreadsAndMessages() {
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["A New Thread"]/*[[".cells.staticTexts[\"A New Thread\"]",".staticTexts[\"A New Thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Checking to make sure this works."]/*[[".cells.staticTexts[\"Checking to make sure this works.\"]",".staticTexts[\"Checking to make sure this works.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
}
