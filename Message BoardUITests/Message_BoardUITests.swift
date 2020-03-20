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
    
    func testCreateMessage() {
        let firstCell = app.cells.firstMatch
        firstCell.tap()
        
        let navBar = app.navigationBars
        let addButton = navBar.buttons.element(boundBy: 1)
        addButton.tap()
        
        let senderField = app.textFields["SenderTextField"]
        let messageField = app.textViews["MessageTextField"]
        XCTAssertTrue(senderField.exists)
        XCTAssertTrue(messageField.exists)
        senderField.tap()
        senderField.typeText("Scott")
        let sendValue = senderField.value as? String
        XCTAssertEqual(sendValue, "Scott")
        
        messageField.tap()
        messageField.typeText("a greate message")
        let messageValue = messageField.value as? String
        XCTAssertEqual(messageValue, "a greate message")
        
        let sendButton = navBar.buttons.element(boundBy: 1)
        sendButton.tap()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertFalse(senderField.exists)
        }
        
    }
    
}
