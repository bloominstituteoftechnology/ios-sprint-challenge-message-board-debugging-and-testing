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
    
    // MARK: - Properties
    var app: XCUIApplication! {
        return XCUIApplication()
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
    
    // MARK: - SetUp Function
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        let app = XCUIApplication()

        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    // MARK: - Tests
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
    
    func testExpectation() {
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://apple.com")!

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "Enrique"
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        XCTAssertEqual("Enrique", name)
    }
}
