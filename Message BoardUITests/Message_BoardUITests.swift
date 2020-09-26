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
    
    private var threadTitleTextField: XCUIElement {
        return app.textFields["Create a new thread:"]
    }
    
    private var firstChild: XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: 0)
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateThread() {
        let createThreadExpectation = expectation(for: NSPredicate(format: "count > 2"), evaluatedWith: app.tables.cells)
        createThreadExpectation.expectationDescription = "Threads should increase from 2 to 3"
        threadTitleTextField.tap()
        threadTitleTextField.typeText("Test")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        waitForExpectations(timeout: 2)
    }
    
    func testLeaveThreadTableViewAndReturn() {
        let count = app.tables.cells.count
        firstChild.tap()
        app.navigationBars["Title"].buttons["λ Message Board"].tap()
        XCTAssertEqual(app.tables.cells.count, count)
    }
    
    func testUICreateMessage() {
        firstChild.tap()
        let createMessageExpectation = expectation(for: NSPredicate(format: "count == 2"), evaluatedWith: app.tables.cells)
        createMessageExpectation.expectationDescription = "Messages should increase to 2"
        app.navigationBars.buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.typeText("Cora")
        app.navigationBars["New Message"].buttons["Send"].tap()
        waitForExpectations(timeout: 5)
    }
    
    func testCancelButton() {
        firstChild.tap()
        app.navigationBars.buttons["Add"].tap()
        let cancelButtonExpectation = expectation(for: NSPredicate(format: "count == 1"), evaluatedWith: app.tables.cells)
        cancelButtonExpectation.expectationDescription = "Table view should be visible"
        app.navigationBars.buttons["Cancel"].tap()
        waitForExpectations(timeout: 2)
    }
    
    func testThreadMessage() {
        XCTAssert(app.staticTexts["A New Thread"].exists)
        app.staticTexts["A New Thread"].tap()
        XCTAssert(app.staticTexts["Checking to make sure this works."].exists)
    }
    
    func testBackButton() {
        firstChild.tap()
        XCTAssertFalse(app.staticTexts["λ Message Board"].exists)
        app.buttons["λ Message Board"].tap()
        XCTAssert(app.staticTexts["λ Message Board"].exists)
    }
}
