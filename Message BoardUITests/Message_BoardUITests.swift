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
    
    func testTableViewUpdatingWithThread() {
        let textField = XCUIApplication().tables["Empty list"].textFields["Create a new thread:"]
        textField.tap()
        textField.typeText("Blah")
        app.buttons["Return"].tap()
        
       let tableViewText = XCUIApplication().tables.children(matching: .cell).element(boundBy: 0).staticTexts["Blah"]
        tableViewText.tap()
        
        XCTAssertEqual(textField.staticTexts, tableViewText.staticTexts)
                                
    }
    
    func testBackButtonPressed() {
        
        let app = XCUIApplication()
        
        let textField = XCUIApplication().tables["Empty list"].textFields["Create a new thread:"]
              textField.tap()
        
        textField.typeText("Blah")
        app.buttons["Return"].tap()
        
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["Blah"].tap()
        let backButton = app.navigationBars.buttons["λ Message Board"]
        backButton.tap()
        
        XCTAssertTrue(backButton.isSelected)
        
    }
}
