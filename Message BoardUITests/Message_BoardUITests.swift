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
    
    func testAddNewMessageBoardTextField() {
        let myTable = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let newThreadTextField = myTable.textFields["Create a new thread:"]
        newThreadTextField.tap()
        newThreadTextField.typeText("New Thread")
        newThreadTextField.typeText("\n")
        let newCell = myTable.cells.staticTexts["New Thread"]
        XCTAssert(newCell.label == "New Thread")
        
        
    }
    
    func testAddNewMessageButton() {
        let myTable = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let newThreadTextField = myTable.textFields["Create a new thread:"]
        newThreadTextField.tap()
        newThreadTextField.typeText("New Thread")
        newThreadTextField.typeText("\n")
        let newCell = myTable.cells.staticTexts["New Thread"]
        newCell.tap()
        let newMessageButton = app.navigationBars["New Thread"].buttons["Add"]
        newMessageButton.tap()
        let nameTextField = app.textFields["Enter your name:"]
        nameTextField.tap()
        nameTextField.typeText("Jordan")
        let sendButton = app.navigationBars["New Message"].buttons["Send"]
        sendButton.tap()
        let messageThreadTable = app.tables.matching(identifier: "MessageThreadDetailTableViewController")
        let messageCell = messageThreadTable.cells.staticTexts["Jordan"]
        
        XCTAssertEqual(messageCell.label, "Jordan")
    }
}
