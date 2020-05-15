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
    
    func testCreatingNewThread() {
        
        // run with an empty tableView
        let threadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        XCTAssertEqual(app.tables.cells.count, 0)

        threadTextField.tap()
        threadTextField.typeText("This is a new thread name.")
        app.keyboards.buttons["Return"].tap()
        XCTAssertEqual(app.tables.cells.count, 1)
    }
    
    func testAddNewMessage() {
        
        // run with an empty tableView
        let threadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
        XCTAssertEqual(app.tables.cells.count, 0)

        threadTextField.tap()
        threadTextField.typeText("This is a new thread name.")
        app.keyboards.buttons["Return"].tap()
        XCTAssertEqual(app.tables.cells.count, 1)
        
        let threadCell = XCUIApplication().tables.children(matching: .cell).element.staticTexts["This is a new thread name."]
        threadCell.tap()
        let navigationBar = XCUIApplication().navigationBars["This is a new thread name."].buttons["Add"]
        navigationBar.tap()
        let textField = XCUIApplication().textFields["Enter your name:"]
        textField.tap()
        textField.typeText("John Smith")
        let addMessage = XCUIApplication().navigationBars["New Message"].buttons["Send"]
        addMessage.tap()
        
        // this should check that the navigation does pop and the user isn't stuck after pressing send
        XCTAssertEqual(app.tables.cells.count, 1)
    }
    
}
