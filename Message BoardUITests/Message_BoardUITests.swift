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

    func testAddNewMessageThread() {
        let table = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let newMessageTextField = table.textFields.element(boundBy: 0)
        newMessageTextField.tap()
        newMessageTextField.typeText("Creating new message thread for UI testing\n")
        let newElement = table.cells.staticTexts["Creating new message thread for UI testing"]
        XCTAssertTrue(newElement.label == "Creating new message thread for UI testing")
    }

    func testCreatingNewMessage() {
        
    }
}
