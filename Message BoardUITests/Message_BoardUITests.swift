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
    
    private var threadTextField: XCUIElement {
        return app.tables.textFields["MessageThreadTVC.CreateNewThread"]
    }
    
    private var enter: XCUIElement {
        return app.keyboards.buttons["return"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateNewMessageThread() {
        threadTextField.tap()
        threadTextField.typeText("Another Thread")
        
        let testThreadCell = app.tables.cells.staticTexts["Another Thread"]
        enter.tap()
        XCTAssertTrue(testThreadCell.exists)
        
    }
    
}
