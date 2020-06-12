//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - Properties
    var isUITesting = true
    
    var app = XCUIApplication()
    
    private var tables: XCUIElementQuery {
        return app.tables
    }
    
    private var enterButton: XCUIElement {
        return app.buttons["Return"]
    }
    
    private var titleTextField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    private var threadCell: XCUIElement {
        return app.tables.cells["ThreadCell"]
    }
    
    private var nameTextField: XCUIElement {
        return app.textFields["Enter your name:"]
    }
    
    private var messageCell: XCUIElement {
        return app.tables.cells["MessageCell"]
    }
    
    // MARK: - Setup
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    // MARK: - Tests - The 3 tests Assert for proper UI display in order to pass
    func testCreateNewThread() {
        
        titleTextField.tap()
        titleTextField.typeText("New Thread")
        enterButton.tap()
        
        XCTAssertEqual(tables.staticTexts["New Thread"].label, "New Thread")

    }
    
    func testAddMessage() {

        titleTextField.tap()
        titleTextField.typeText("Test Add Message")
        app.buttons["Return"].tap()
        
        XCTAssertEqual(tables.staticTexts["Test Add Message"].label, "Test Add Message")
        XCTAssertEqual(threadCell.staticTexts["Test Add Message"].label, "Test Add Message")
        let testAdd = tables.staticTexts["Test Add Message"]
        testAdd.tap()
        
        let testAddNavBar = app.navigationBars["Test Add Message"]
        testAddNavBar.buttons["Add"].tap()
        
        nameTextField.tap()
        XCTAssert(nameTextField.exists)
        nameTextField.typeText("Mark")
        enterButton.tap()
        
        let messageTextView = app.textViews["MessageTextView"]
        XCTAssert(messageTextView.exists, "MessageTextView")

        messageTextView.tap()
        messageTextView.typeText("Message")
        
        let newMessageNavigationBar = app.navigationBars["New Message"]
        newMessageNavigationBar.buttons["Send"].tap()
        XCTAssertEqual(messageCell.staticTexts["Message"].label, "Message")
    }
    
    func testScreenNavigation() {
        
        let newThread = app.tables.staticTexts["A New Thread"]
        newThread.tap()
        XCTAssert(app.staticTexts["A New Thread"].exists)
        
        let newThreadNavBar = app.navigationBars["A New Thread"]
        newThreadNavBar.buttons["Add"].tap()
        XCTAssert(app.staticTexts["New Message"].exists)
        
        app.navigationBars["New Message"].buttons["Cancel"].tap()
        XCTAssert(app.staticTexts["A New Thread"].exists) // This line is to check that the title is appearing now
        
        newThreadNavBar.buttons["λ Message Board"].tap()
        XCTAssert(tables.textFields["Create a new thread:"].exists)
    }
}
