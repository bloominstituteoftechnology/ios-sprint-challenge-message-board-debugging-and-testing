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
    
    func testCreatingThread() {
        
        // Taps on text field, types Hello, taps return
        let thread = XCUIApplication().tables.textFields["Create a new thread:"]
        
        XCTAssertEqual(app.tables.cells.count, 0)
        thread.tap()
        thread.typeText("Hello")
        app.keyboards.buttons["Return"].tap()
        
        // Tests to see if the new thread populates the table view
        XCTAssertEqual(app.tables.cells.count, 1)
    }
    
    func testCreatingNewMessage() {
        
        // Creates thread in previous test
        let thread = XCUIApplication().tables.textFields["Create a new thread:"]
        XCTAssertEqual(app.tables.cells.count, 0)
        thread.tap()
        thread.typeText("Hello")
        app.keyboards.buttons["Return"].tap()
        
        // Taps on thread
        let testThread = app.tables.staticTexts["Hello"]
        testThread.tap()
        
        // Taps on add button
        let addMessageButton = app.navigationBars.buttons.element(boundBy: 1)
            addMessageButton.tap()
        
        // Taps and types name for message
        let messageName = app.textFields["Enter your name:"]
        messageName.tap()
        messageName.typeText("Kevin")
        app.keyboards.buttons["Return"].tap()
        
        // Taps send button
        let sendButton = app.buttons["Send"]
        sendButton.tap()
        
        // Tests to see if there is a new message in thread
        XCTAssert(app.tables.cells.count == 1, "Kevin")
    }
    
    // Test asynchronous logic using an expectation
    func testExpectation() {
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://apple.com")!

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "Dave"
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        XCTAssertEqual("Dave", name)
    }
    
}
