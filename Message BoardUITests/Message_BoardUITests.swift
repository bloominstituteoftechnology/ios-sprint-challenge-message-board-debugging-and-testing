//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - Properties
    
    var app: XCUIApplication!
    
    private var threadTextField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    private var nameTextField: XCUIElement {
        return app.textFields["Enter your name:"]
        
    }
    
    private var sendButton: XCUIElement {
        return app.navigationBars["New Message"].buttons["Send"]
    }
    
    private var returnButton: XCUIElement {
        return app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards.buttons[\"Return\"]",".buttons[\"Return\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    }
    
    // MARK: - Tests
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateThread() {
        threadTextField.tap()
        threadTextField.typeText("SprintUITest")
        returnButton.tap()
    }
    
    func testCreateMessage() {
        app.tables.staticTexts["Testing again"].tap()
        app.navigationBars["Testing again"].buttons["Add"].tap()
        nameTextField.tap()
        nameTextField.typeText("SprintUITestTitle")
        sendButton.tap()
    }
}
