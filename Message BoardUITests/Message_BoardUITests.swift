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
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testSendMessageButton() {

        let app = XCUIApplication()
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()

        let nameTextField = app.textFields["nameTextField"]
        nameTextField.tap()
        nameTextField.typeText("Help")

        let messageTextView = app.textViews["messageTextView"]
        messageTextView.tap()
        messageTextView.typeText("Me")

        app.navigationBars["New Message"].buttons["Send"].tap()
        
        let helpCell = app.tables.cells.staticTexts["Help"]
        
        XCTAssertTrue(helpCell.exists)
    }
    
}
