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
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testAddNewMessageBoard() {
        let table = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let newMessageTextField = table.textFields.element(boundBy: 0)
        newMessageTextField.tap()
        newMessageTextField.typeText("Creating a New Thread for UI Testing")
        newMessageTextField.typeText("\n")
        let verifyNewElement = table.cells.staticTexts["Creating a New Thread for UI Testing"]
        XCTAssertTrue(verifyNewElement.label == "Creating a New Thread for UI Testing")
    }

    func testAddNewMessageButton() {
        let table = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let newMessageTextField = table.textFields.element(boundBy: 0)
        newMessageTextField.tap()
        newMessageTextField.typeText("Creating a New Thread for UI Testing")
        newMessageTextField.typeText("\n")
        let newElement = table.cells.staticTexts["Creating a New Thread for UI Testing"]
        newElement.tap()
        let newMessageButton = app.navigationBars["Creating a New Thread for UI Testing"].buttons["Add"]
        newMessageButton.tap()
        let nameTextField = app.textFields.firstMatch
        XCTAssert(nameTextField.isHittable)
        nameTextField.tap()
        nameTextField.typeText("Test Name")
        let sendButton = app.navigationBars["New Message"].buttons["Send"]
        sendButton.tap()
        let messageTable = app.tables.matching(identifier: "MessageThreadDetailTableViewController")
        let message = messageTable.cells.staticTexts["Test Name"]
        XCTAssertEqual(message.label, "Test Name")
    }
}
