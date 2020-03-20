//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class Message_BoardUITests: XCTestCase {
    
    // MARK: - ENUM Identifier
    enum Identifier: String {
        case threadsCellLabel = "MessageThreadsTableViewController.CellTitleLabel"
        case newThreadTextField = "ThreadTableViewController.NewThreadTextField"
        case newMessageNameTextField = "NewMessageVC.NameTextField"
    }
    
    
    // MARK: - Properties
    var app: XCUIApplication!
    let newThreadTitle = "Local Test"
    let messageText = "Hello there! I'm a brand new message"
    
    // MARK: - Helper
    func label(forID ID: Identifier) -> XCUIElement {
        return app.staticTexts[ID.rawValue]
    }
    
    func textField(forID ID: Identifier) -> XCUIElement {
        return app.textFields[ID.rawValue]
    }
    
    func newThread() {
        let app = XCUIApplication()
        app.tables["Empty list"].textFields[Identifier.newThreadTextField.rawValue].tap()
        app.buttons["Return"].tap()
        let newThreadTextField = textField(forID: .newThreadTextField)
        newThreadTextField.tap()
        newThreadTextField.typeText(newThreadTitle)
        app.keyboards.buttons["Return"].tap()
    }
    
    func newMessage() {
        newThread()
        XCTAssert(app.cells.element(boundBy: 0).isHittable)
        app.cells.element(boundBy: 0).tap()
        let addButton = app.navigationBars.buttons["Add"]
        XCTAssert(addButton.isHittable)
        addButton.tap()
        let newMessageNameTextField = textField(forID: .newMessageNameTextField)
        XCTAssert(newMessageNameTextField.isHittable)
        newMessageNameTextField.tap()
        newMessageNameTextField.typeText(messageText)
        app.navigationBars["New Message"].buttons["Send"].tap()
    }
    
    
    // MARK: - Setup Function
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Tests
    func testNewThread() {
        newThread()
        let threadsCellLabel = label(forID: .threadsCellLabel)
        XCTAssert(threadsCellLabel.exists)
        XCTAssertEqual(threadsCellLabel.label, newThreadTitle)
    }
    
    func testNewMessage() {
        newMessage()
        XCTAssert(app.staticTexts[messageText].exists)
    }
}
