//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    // Where is the coverage test...
    var app: XCUIApplication = XCUIApplication()

    // MessageThreadsTableViewController
    var createNewThread: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.ThreadTitleTextField"]
    }
    var messageThreadCell: XCUIElement {
        return app.cells["MessageThreadsTableViewController.MessageThreadCell"]
    }
    
    // MessageThreadDetailTableViewController
    var messageCell: XCUIElement {
        return app.cells["MessageThreadDetailTableViewController.MessageCell"]
    }
    var messageAddButton: XCUIElement {
        return app.buttons["Add"]
    }
    
    // MessageDetailViewController
    var messageSender: XCUIElement {
        return app.textFields["MessageDetailViewController.SenderNameTextField"]
    }
    var messageContent: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    var messageSendButton: XCUIElement {
        return app.buttons["Send"]
    }
    var messageTitleButton: XCUIElement {
        return app.buttons["Title"]
    }
    var messageBackButton: XCUIElement {
        return app.navigationBars["New Message"].buttons["Back"]
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
        XCTAssert(createNewThread.exists)
        createNewThread.typeText("testCreateThread()\n")
        messageThreadCell.tap()
        XCTAssert(messageThreadCell.exists)
        XCTAssert(messageAddButton.exists)
        messageAddButton.tap()
        messageSender.tap()
        XCTAssert(messageSender.exists)
        messageSender.typeText("Steve Jobs")
        messageContent.tap()
        XCTAssert(messageContent.exists)
        messageContent.typeText("I should invent a wired air mouse.\n It would make Ivan very happy! Hmmmmm...")
        XCTAssert(messageSendButton.exists)
        messageSendButton.tap()
    }
    
    
    
}
