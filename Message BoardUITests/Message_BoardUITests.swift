//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

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
    
    var newMessageTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.createNewMessageTextField"]
    }
    
    var newMessageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.createNewMessageTextView"]
    }
    
    var sendButton: XCUIElement {
        // newMessageNavigationBar.buttons["Send"].tap()
        return app.buttons["Send"]
        
    }
    
    var messageBoardTitle: XCUIElement {
        
        //return app.staticTexts["λ Message Board"]
        return app.otherElements["MessageThreadTVCTitle"]
    }
    
    var returnKey: XCUIElement {
        return app.keyboards.buttons["Return"]
    }
    
    var backButton: XCUIElement {
        return app.buttons["λ Message Board"]
        
    }
    
    var addButton: XCUIElement {
        return app.buttons["Add"]
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
        //FIXME: - 🤬🤬🤬
//        XCTAssertTrue(messageBoardTitle.exists)
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
        
        
   
       // app.navigationBars["trees art"].buttons["λ Message Board"].tap()
        
    }
    
    // tapping on a message thread cell
    func testTappingOnMessageThreadCell() {
       
        // test title
        // does text field exist
        XCTAssertTrue(newTestThreadTextField.exists)
        // tap textfield for focus
        newTestThreadTextField.tap()
        // enter text in text field for thread #1
        newTestThreadTextField.typeText(newTestThreadName1)
        // press return & create Thread
        returnKey.tap()
        // test cell exists
        XCTAssertTrue(app.tables.cells.staticTexts[newTestThreadName1].exists)
        // tap on cell
        app.tables.cells.staticTexts[newTestThreadName1].tap()
        // test cell title matches thread title
        XCTAssertTrue(app.staticTexts[newTestThreadName1].exists)
        // test back button exisits
        XCTAssertTrue(backButton.exists)
        // test add button exists
        backButton.tap()
        

    }
    

    // MARK: - MessageThreadDetailTableViewController Tests
    
    // add a new message to thread
    func testAddNewMessageToThread() {
        
        // does text field exist
        XCTAssertTrue(newTestThreadTextField.exists)
        // tap textfield for focus
        newTestThreadTextField.tap()
        // enter text in text field for thread #1
        newTestThreadTextField.typeText(newTestThreadName1)
        // press return & create Thread
        returnKey.tap()
        // test cell exists
        XCTAssertTrue(app.tables.cells.staticTexts[newTestThreadName1].exists)
        // tap on cell
        app.tables.cells.staticTexts[newTestThreadName1].tap()
        // test cell title matches thread title
        XCTAssertTrue(app.staticTexts[newTestThreadName1].exists)
        // test back button exisits
        XCTAssertTrue(backButton.exists)
        // test add button exists
        XCTAssertTrue(addButton.exists)
        // tap add button
        addButton.tap()
        // test create message
        // test text field exists
        XCTAssertTrue(newMessageTextField.exists)
        // tap text field to focus
        newMessageTextField.tap()
        //enter message title
        app.textFields["Enter your name:"].typeText(newTestMessage1Title)
        //newTestThreadTextField.typeText(newTestMessage1Title)
        // hit enter just in case
        returnKey.tap()
        // test text view exists
        XCTAssertTrue(newMessageTextView.exists)
        // tap it to focus
        newMessageTextView.tap()
        // enter message body text
        app.textViews["MessageDetailViewController.createNewMessageTextView"].typeText(newTestMessage1Text1)
        // tap enter JIC
        returnKey.tap()
        // tap save button
        sendButton.tap()
        // test cell exists
        XCTAssertTrue(app.tables.cells.staticTexts[newTestMessage1Title].exists)

        // test abort without send
        
        // test send without input?
        
        
    }
    
    
    
}
