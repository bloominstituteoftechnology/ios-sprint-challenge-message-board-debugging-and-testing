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
    
    var app: XCUIApplication! {
        return XCUIApplication()
    }

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        let app = XCUIApplication()

        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testCreateThread() {
        createThread.tap()
        createThread.typeText("UITest")
        app.keyboards.buttons["Return"].tap()
        XCTAssertTrue(app.tables.staticTexts["UITest"].exists)
    }
    
    func testCreateThread2() {
        createThread.tap()
        createThread.typeText("Another Text")
        app.keyboards.buttons["Return"].tap()
        XCTAssertTrue(app.tables.staticTexts["Another Text"].exists)
    }

    private var createThread: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }

    private var sender: XCUIElement {
        return app.textFields["SenderNameTextField"]
    }

    private var messageText: XCUIElement {
        return app.textViews["MessageTextview"]
    }
}
