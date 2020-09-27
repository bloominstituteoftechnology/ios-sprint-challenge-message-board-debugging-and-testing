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
    
    private var newThreadTextField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateNewThread() {
        newThreadTextField.tap()
        newThreadTextField.typeText("Hurry and create it rn")
        app.buttons["Return"].tap()
        XCTAssert(app.tables.staticTexts["Hurry and create it rn"].exists)
    }
}
