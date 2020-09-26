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
    
}
