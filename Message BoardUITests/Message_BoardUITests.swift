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
    
    func testOpenMessageThread() {
        XCTAssert(app.tables.cells["MessageThreadCell"].exists)
        
        app.tables.cells.element(boundBy: 1).tap()
        
        XCTAssert(app.tables.cells["MessageCell"].exists)
    }
    
    func testCreateNewThreadButton() {
          
        let rightNavBarButton = app.navigationBars.children(matching: .button).firstMatch
        XCTAssert(rightNavBarButton.exists)
        rightNavBarButton.tap()
        
    }
    
    func testCreateNewThreadAndSave() {
          
        let rightNavBarButton = app.navigationBars.children(matching: .button).firstMatch
        XCTAssert(rightNavBarButton.exists)
        rightNavBarButton.tap()
        
        let textField = app.textFields["NewMessageThreadTextField"]
        textField.tap()
        textField.typeText("XCTEST NEW MESSAGE THREAD")
        
        let saveButton = app.navigationBars.children(matching: .button).firstMatch
        XCTAssert(saveButton.exists)
        saveButton.tap()
        
    }
    
    func testBackButtonInMessageThread() {
        
        XCTAssert(app.tables.cells["MessageThreadCell"].exists)
        
        app.tables.cells.element(boundBy: 1).tap()
        
        XCTAssert(app.tables.cells["MessageCell"].exists)
        
        let backButton = app.navigationBars.children(matching: .button).firstMatch
        XCTAssert(backButton.exists)
        backButton.tap()
        
        XCTAssert(app.tables.cells["MessageThreadCell"].exists)
        
    }
    
    func testCreateNewMessage() {
        
        XCTAssert(app.tables.cells["MessageThreadCell"].exists)
        
        app.tables.cells.element(boundBy: 1).tap()
        
        let addButton = app.navigationBars.children(matching: .button).element(boundBy: 1)
        
        XCTAssert(addButton.exists)
        
        addButton.tap()
        
        let nameTextField = app.textFields["SenderNameTextField"]
        XCTAssert(nameTextField.exists)
        nameTextField.tap()
        nameTextField.typeText("XCTEST UI")
        
        let messageTextField = app.textViews["MessageTextView"]
        XCTAssert(messageTextField.exists)
        messageTextField.tap()
        messageTextField.typeText("THIS IS A XCTEST UI MESSAGE")
        
        let sendButton = app.navigationBars.children(matching: .button).element(boundBy: 1)
        XCTAssert(sendButton.exists)
        sendButton.tap()
        
        let okButton = app.alerts.buttons.firstMatch
        XCTAssert(okButton.exists)
        okButton.tap()
        
    }
    
    func testCancelANewMessage() {
        
        XCTAssert(app.tables.cells["MessageThreadCell"].exists)
        
        app.tables.cells.element(boundBy: 1).tap()
        
        let addButton = app.navigationBars.children(matching: .button).element(boundBy: 1)
        
        XCTAssert(addButton.exists)
        
        addButton.tap()
        
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssert(backButton.exists)
        backButton.tap()
        
    }
    
    func testCancelANewThread() {
        
        let rightNavBarButton = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssert(rightNavBarButton.exists)
        rightNavBarButton.tap()
        
        let backButton = app.navigationBars.element(boundBy: 0)
        XCTAssert(backButton.exists)
        
        backButton.tap()
        
        
    }
}
