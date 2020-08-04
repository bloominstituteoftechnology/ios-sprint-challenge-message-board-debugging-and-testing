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
    
      func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }



    func testCreateThread() {

     try! setUpWithError()

        let createThreadTextField = XCUIApplication().tables.textFields["Create new message thread"]
        createThreadTextField.tap()

        createThreadTextField.typeText("Test New Thread")
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.tables.cells.staticTexts["Test New Thread"].exists)
    }



        func testCreateMessage() {
            try! setUpWithError()

            let table = app.tables.matching(identifier: "MessageThreadsTableViewController")

                let messageTextField = table.textFields.element(boundBy: 0)
                messageTextField.tap()
                messageTextField.typeText("Message for UI Test\n")

                let newThread = table.cells.staticTexts["Message for UI Test"]
                newThread.tap()

                let messageButton = app.navigationBars["Message for UI Test"].buttons["Add"]
                messageButton.tap()
                let nameTextField = app.textFields.firstMatch
            
                XCTAssert(nameTextField.isHittable)

                nameTextField.tap()
                nameTextField.typeText("Ian")

                let sendButton = app.navigationBars["New Message"].buttons["Send"]
                sendButton.tap()

                let detailTable = app.tables.matching(identifier: "MessageThreadDetailTableViewController")
                let message = detailTable.cells.staticTexts["Ian"]

                XCTAssertEqual(message.label, "Ian")
            }


        }
//}
