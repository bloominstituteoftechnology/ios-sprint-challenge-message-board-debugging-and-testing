//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var titleTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.titleTextField"]
    }
    
    private var tableView: XCUIElementQuery {
        return app.tables
    }
    private var titleLabel: XCUIElement {
        return app.staticTexts["MessageThreadsTableViewController.threadLabel"]
    }
    
    private var messageLabel: XCUIElement {
        return app.staticTexts["MessageThreadDetailTableViewController.messageLabel"]
    }
    
    private var nameLabel: XCUIElement {
        return app.staticTexts["MessageThreadDetailTableViewController.nameLabel"]
    }
    
    private var nameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.nameTextField"]
    }
    // MessageDetailViewController.nameTextField
    private var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.messageTextView"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testAddNewThread() {
        titleTextField.tap()
        XCTAssert(titleTextField.exists)
        titleTextField.typeText("Thomas give me a 3 on this Sprint!")
        app.buttons["Return"].tap()
        tableView.staticTexts["Thomas give me a 3 on this Sprint!"].tap()
        XCTAssert(app.navigationBars.staticTexts["Thomas give me a 3 on this Sprint!"].exists)
    }
    
    func testBackButton() {
        tableView.staticTexts["A New Thread"].tap()
        XCTAssert(app.navigationBars.staticTexts["A New Thread"].exists)
        app.navigationBars.buttons["λ Message Board"].tap()
        XCTAssert(app.navigationBars.staticTexts["λ Message Board"].exists)
    }

    func testSaveNewThreadWithMessage() {
        titleTextField.tap()
        XCTAssert(titleTextField.exists)
        titleTextField.typeText("Thomas give me a 3 on this Sprint!")
        app.buttons["Return"].tap()
        tableView.staticTexts["Thomas give me a 3 on this Sprint!"].tap()
        XCTAssert(app.navigationBars.staticTexts["Thomas give me a 3 on this Sprint!"].exists)
        XCTAssert(app.navigationBars.buttons["Add"].exists)
        app.navigationBars.buttons["Add"].tap()
        XCTAssert(nameTextField.exists)
        nameTextField.tap()
        nameTextField.typeText("Anonymous")
        XCTAssertEqual(nameTextField.value as! String, "Anonymous")
        XCTAssert(messageTextView.exists)
        messageTextView.tap()
        messageTextView.typeText("You will never find out my true identity, muahaha")
        XCTAssertEqual(messageTextView.value as! String, "You will never find out my true identity, muahaha")
        app.navigationBars.buttons["Send"].tap()
    }
}
