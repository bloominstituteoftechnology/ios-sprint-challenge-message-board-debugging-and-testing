//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    //var app: XCUIApplication = XCUIApplication()
    //var app: XCUIApplication!
    
    // MessageThreadsTableViewController
    var createNewThread: XCUIElement {
        let app = XCUIApplication()
        //return app.tables.textFields["MessageThreadsTableViewController.ThreadTitleTextField"]
        return app.textFields["MessageThreadsTableViewController.ThreadTitleTextField"]
        //return app.staticTexts["Create a new thread:"]
    }
    
    var messageThreadCell: XCUIElement {
        let app = XCUIApplication()
        return app.cells["MessageThreadsTableViewController.MessageThreadCell"]
    }
    
    // MessageThreadDetailTableViewController
    var messageCell: XCUIElement {
        let app = XCUIApplication()
        return app.cells["MessageThreadDetailTableViewController.MessageCell"]
    }
    // Message Add button...
    
    // MessageDetailViewController
    var messageSender: XCUIElement {
        let app = XCUIApplication()
        return app.textFields["MessageDetailViewController.SenderNameTextField"]
    }
    
    var messageContent: XCUIElement {
        let app = XCUIApplication()
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    
    
    
    
    
    
    override func setUp() {
        super.setUp()
        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    

    func testRecordCreated() {
      
      
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.textFields["Create a new thread:"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Record"]/*[[".cells.matching(identifier: \"MessageThreadsTableViewController.MessageThreadCell\").staticTexts[\"Record\"]",".staticTexts[\"Record\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let recordNavigationBar = app.navigationBars["Record"]
        recordNavigationBar.buttons["Add"].tap()
        app/*@START_MENU_TOKEN@*/.textFields["MessageDetailViewController.SenderNameTextField"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"MessageDetailViewController.SenderNameTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let textView = app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        recordNavigationBar.buttons["λ Message Board"].tap()
        
    }

    
    
    func testCreateThread() {
        createNewThread.tap()
       // createNewThread.typeText("Testing testCreateThread()\n")
    }
    
}
