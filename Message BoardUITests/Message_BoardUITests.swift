//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    // MARK: - Tests

    func testAddNewThread() {
        let table = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let newMessageTextField = table.textFields.element(boundBy: 0)
        newMessageTextField.tap()
        newMessageTextField.typeText("Creating new message thread for UI testing\n")
        let newElement = table.cells.staticTexts["Creating new message thread for UI testing"]
        XCTAssertTrue(newElement.label == "Creating new message thread for UI testing")
    }

    func testCreatingNewMessage() {
        let table = app.tables.matching(identifier: "MessageThreadsTableViewController")


            let messageTextField = table.textFields.element(boundBy: 0)
            messageTextField.tap()
            messageTextField.typeText("Creating a thread for UI Testing\n")

            let newThread = table.cells.staticTexts["Creating a thread for UI Testing"]
            newThread.tap()

            let messageButton = app.navigationBars["Creating a thread for UI Testing"].buttons["Add"]
            messageButton.tap()

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




