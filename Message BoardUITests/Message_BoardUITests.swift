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

        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testCreateThread() {
        setUpThread()
        XCTAssertTrue(app.staticTexts["test test"].exists)
    }

    func testCreateMessage() {
        setUpThread()
        app.tables.staticTexts["test test"].tap()
        toAddMessage()
        setUpMessage()
        app.buttons["Send"].tap()
        XCTAssertTrue(app.staticTexts["Message"].exists)
    }
    //MARK: - Private 
    private func setUpThread() {
        app.launch()
        app.textFields["Create a new thread:"].tap()
        app.keys["h"].tap()
        app.keys["e"].tap()
        app.keys["l"].tap()
        app.keys["l"].tap()
        app.keys["o"].tap()
        app.buttons["Return"].tap()
    }

    private func toAddMessage() {
        app.buttons["Add"].tap()
    }

    private func setUpMessage() {
        app.textFields["Enter your name:"].tap()

        app.keys["J"].tap()
        app.keys["O"].tap()
        app.keys["E"].tap()
    }
}



