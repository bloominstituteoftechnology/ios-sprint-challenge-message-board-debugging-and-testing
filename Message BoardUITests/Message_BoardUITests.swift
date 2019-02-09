//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    
    // MARK: - Setup
    var app: XCUIApplication! = XCUIApplication()
    
    var newTestThreadName1 = "Test Thread #1"
    
    var newTestThreadName2 = "Test Thread #2"
    var newTestThreadName3 = "Test Thread #3"
    
    var newTestMessage1Title = "New Message #1"
    var newTestMessage1Text1 = "This is New Message #1"
    
    var newTestMessage2Title = "New Message #2"
    var newTestMessage2Text1 = "This is New Message #2"
    
    var messageBoardTitleString = "λ Message Board"
    
    var newMessageDetailViewTitle = "New Message"
    
    var newTestThreadTextField: XCUIElement {
//        return app.tables.textFields["MessageThreadsTableViewController.createNewThreadTextField"]
        return app.textFields["MessageThreadsTableViewController.createNewThreadTextField"]
    }
    
    var sendButton: XCUIElement {
        // newMessageNavigationBar.buttons["Send"].tap()
        return app.buttons["Add"]
        
    }
    
    var messageBoardTitle: XCUIElement {
        return app.staticTexts["λ Message Board"]
    }
    
    var returnKey: XCUIElement {
        return app.keyboards.buttons["Return"]
    }
    
    
    
    
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
        
    }
    
    
    // MARK: - MessageThreadsTableViewController Tests
    
    // add a new message thread
    func testCreateNewMessageThread() {
        // is title correct
        //XCTAssertTrue(messageBoardTitle.exists)
        // does text field exist
        XCTAssertTrue(newTestThreadTextField.exists)
        // tap textfield for focus
        newTestThreadTextField.tap()
        // enter text in text field for thread #1
        newTestThreadTextField.typeText(newTestThreadName1)
        // press return & create Thread
        returnKey.tap()
        // test that thread cell exists
        XCTAssertTrue(app.tables.cells.staticTexts[newTestThreadName1].exists)
        // tap textfield for focus
        newTestThreadTextField.tap()
        // enter text in text field for thread #2
        newTestThreadTextField.typeText(newTestThreadName2)
        // press return & create Thread
        returnKey.tap()
        // test that thread cell exists
        XCTAssertTrue(app.tables.cells.staticTexts[newTestThreadName2].exists)
        
    }
    
    // tapping on a message thread cell
    func testTappingOnMessageThreadCell() {
       
        // test title
        
        // test cell exists
        
        // tap on cell
        
        // test cell title matches thread title
        
        // test back button
        
        // test create new thread #2
        
        // test cell exists
        
        // tap on it
        
        // test title matches thread title again
        
    }
    

    // MARK: - MessageThreadDetailTableViewController Tests
    
    // add a new message to thread
    func testAddNewMessageToThread() {
        // tap on existing cell **YAY persistence**
        
        // does title still match
        
        // does add button exist
        
        // tap on it
        
        // test title
        
        // test text field exists
        
        // test text view exists
        
        // test abort without send
        
        // test input textfield
        
        // test input textview
        
        // test send button
        
        // test send without input?
        
        
    }
    
    
    
}
