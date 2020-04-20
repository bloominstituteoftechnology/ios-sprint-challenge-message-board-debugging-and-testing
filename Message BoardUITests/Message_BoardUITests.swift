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
    
    func testCreatingNewThread() {
    
        let threadCell = XCUIApplication().tables.textFields["Create a new thread:"]
        
        XCTAssertEqual(app.tables.cells.count, 2)
        threadCell.tap()
        threadCell.typeText("A brand-spanking new thread!")
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertEqual(app.tables.cells.count, 3)
    }
    
    func testTapOnFirstCell() {
        
    let threadCell = XCUIApplication().tables.element(boundBy: 0).cells.element(boundBy: 0)
        threadCell.tap()
    }
    
    func testAddNewMessage() {

        let threadCell = XCUIApplication().tables.children(matching: .cell).element.staticTexts["A New Thread"]
        threadCell.tap()
        
        let navigationBar = XCUIApplication().navigationBars["A New Thread"].buttons["Add"]
        navigationBar.tap()
        
        let textField = XCUIApplication().textFields["Enter your name:"]
        textField.tap()
        textField.typeText("Billy Bob")

        let addMessage = XCUIApplication().navigationBars["New Message"].buttons["Send"]
        addMessage.tap()

    }
    
    
    
}
