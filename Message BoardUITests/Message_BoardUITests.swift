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
    
    
    func testCreateThread() {
        createNewThread.tap()
        XCTAssert(createNewThread.exists)
        createNewThread.typeText("testCreateThread()\n")
        XCTAssert(messageThreadCell.exists)
        let testCell = app.staticTexts["A New Thread"]
        XCTAssertTrue(testCell.exists)
        testCell.tap()
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
