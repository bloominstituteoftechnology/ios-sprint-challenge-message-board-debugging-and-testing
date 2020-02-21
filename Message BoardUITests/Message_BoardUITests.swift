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
    enum Identifier: String {
        case threadsCellLabel = "MessageThreadsTableViewController.CellTitleLabel"
        case newThreadTextField = "ThreadTableViewController.NewThreadTextField"
        case newMessageNameTextField = "NewMessageVC.NameTextField"
        case newMessageNameTextArea = "NewMessageVC.NameTextArea"
        case messageThreadCellNameLabel = "MessageThreadDetailTableViewController.CellTitleLabel"
        case messageThreadMessageLabel = "MessageThreadDetailTableViewController.CellSubtitleLabel"
    }
    
    var app: XCUIApplication!
    
    func label(forId id: Identifier) -> XCUIElement {
        return app.staticTexts[id.rawValue]
    }
    
    func textField(forId id: Identifier) -> XCUIElement {
        return app.textFields[id.rawValue]
    }
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testNewThread() {
        let app = XCUIApplication()
        app.tables["Empty list"].textFields[Identifier.newThreadTextField.rawValue].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let newThreadTextField = textField(forId: .newThreadTextField)
        newThreadTextField.tap()
        newThreadTextField.typeText("Local Test")
        app.keyboards.buttons["Return"].tap()
        let threadsCellLabel = label(forId: .threadsCellLabel)
        XCTAssert(threadsCellLabel.exists)
        XCTAssertEqual(threadsCellLabel.label, "Local Test")
    }
    
    func testNewMessage() {
        //create a new local thread
        testNewThread()
        //test and tap the first cell
        XCTAssert(app.cells.element(boundBy: 0).isHittable)
        app.cells.element(boundBy: 0).tap()
        //test and tap the add button
        let addButton = app.navigationBars.buttons["Add"]
        XCTAssert(addButton.isHittable)
        addButton.tap()
        //test the name textField, type New Message, and save
        let newMessageNameTextField = textField(forId: .newMessageNameTextField)
        XCTAssert(newMessageNameTextField.isHittable)
        //type text and save
        newMessageNameTextField.tap()
        newMessageNameTextField.typeText("I'm a new message")
        app.navigationBars["New Message"].buttons["Send"].tap()
        //go back and check for message
        let backButton = app.navigationBars["New Message"].buttons["Local Test"]
        backButton.tap() //remove if pop VC
        XCTAssert(app.staticTexts["I'm a new message"].exists)
    }
    
}
