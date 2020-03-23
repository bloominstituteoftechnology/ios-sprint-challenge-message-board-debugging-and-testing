//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var textField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    private var textCell1: XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["Test"]
    }
    private var threadBackButton: XCUIElement {
        return app.navigationBars.buttons["λ Message Board"]
    }
    private var addButton: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testEnterText() {
        XCTAssertTrue(textField.exists)
        textField.tap()
        textField.typeText("Test")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testTapThread() {
        testEnterText()
        XCTAssertTrue(textCell1.exists)
        textCell1.tap()
    }
    
    func testMessageBoardTapped() {
        testTapThread()
              XCTAssertTrue(threadBackButton.exists)
              threadBackButton.tap()
              XCTAssertFalse(threadBackButton.exists)
    }
    
    func testAddTapped(){
      testTapThread()
        XCTAssertTrue(addButton.exists)
        addButton.tap()
    }
    
    
}
