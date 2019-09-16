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
        // KEEP THIS SETUP FUNCTION EXACTLY AS IS
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func tableView(id: String) -> XCUIElement {
        let tableView = app.tables[id]
        XCTAssertTrue(app.tables[id].exists)
        return tableView
    }
    
    func testThreadCellLabel() {
        XCTAssertTrue(tableView(id: "ThreadTableView").cells.firstMatch.exists)
    }
    
    func testMessageCellLabel() {
        tableView(id: "ThreadTableView").cells.firstMatch.tap()
        XCTAssertTrue(tableView(id: "MessageTableView").cells.firstMatch.exists)
    }
    
    func testMessageTableViewTitleIsSameAsThreadTitle() {
        tableView(id: "ThreadTableView").cells.staticTexts["Testing again"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Testing again"].exists)
    }
    
    func testNaviagtionToMessageTableView() {
        app.cells.firstMatch.tap()
        XCTAssertTrue(app.buttons.element(boundBy: 1).exists)
        XCTAssertTrue(tableView(id: "MessageTableView").exists)
    }
    
    func testNavigationFromMessageTableViewToThreadTableView() {
        app.cells.firstMatch.tap()
        XCTAssertTrue(app.buttons.element(boundBy: 0).exists)
        app.buttons.element(boundBy: 0).tap()
        XCTAssertTrue(tableView(id: "ThreadTableView").exists)
    }
    
    func testMessageTextInCellLabel() {
        tableView(id: "ThreadTableView").cells.staticTexts["Testing again"].tap()
        XCTAssertTrue(app.cells.staticTexts["It’s working!"].exists)
    }
    
    
    func testMessage() {
        app.cells.firstMatch.tap()
        app.navigationBars.buttons.element(boundBy: 1).tap()
        let textfield = app.textFields.element
        let textView = app.textViews.element
        textfield.tap()
        textfield.typeText("TestTitle")
        textView.tap()
        textView.typeText("Test")
        app.tap()
        XCTAssertEqual("Test", textView.value as? String)
        app.navigationBars.buttons.element(boundBy: 1).tap()
       XCTAssertTrue(app.cells.staticTexts["Test"].exists)
    }
    
    //Test for bug 5 in Bugs.MD
    func testThreadDisplaysInLabel() {
        let textField = app.textFields.element
        textField.tap()
        textField.typeText("TestThread")
        app.keyboards.buttons["Return"].tap()
        XCTAssertTrue(app.cells.staticTexts["TestThread"].exists)
    }
}

