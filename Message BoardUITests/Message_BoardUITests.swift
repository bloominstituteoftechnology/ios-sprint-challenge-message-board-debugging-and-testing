//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
 
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    // I am not sure this one actually works. I will keep working on it ... 
    func testTapOnAllMessages() {
        
        let app = XCUIApplication()
        let cellCount = app.tables.cells["ThreadCells"].cells.count
        for index in 0..<cellCount {
            app.tables.cells["ThreadCells"].cells.element(boundBy: index).tap()
            XCTAssertTrue(app.navigationBars.buttons["λ Message Board"].exists)
            usleep(5000000)
            app.navigationBars.buttons["λ Message Board"].tap()
        }
    }
    
    
//    func testCreateNewThread() {
//       
//        app.
//        newThreadTextField.typeText("Test New Thread")
//        app.keyboards.buttons["Return"].tap()
//        XCTAssertTrue(app.tables.cells["Test New Thread"].exists)
//    }
    
    func testCreateNewThread() {
        let app = XCUIApplication()
        
        let createANewThreadTextField = app.tables.textFields["Create a new thread:"]
        createANewThreadTextField.tap()
        createANewThreadTextField.typeText("XCTesting1")
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.tables.staticTexts["XCTesting1"].exists)
    }
    
    func testCreateAdditionalMessageAndBack() {
        let app = XCUIApplication()
        let cell = app.tables.staticTexts["A New Thread"]
        XCTAssert(cell.exists)
        cell.tap()
        let addButton = app.navigationBars["A New Thread"].buttons["Add"]
        XCTAssert(addButton.exists)
        addButton.tap()
        let textField = app.textFields["Enter your name:"]
        XCTAssert(textField.exists)
        textField.tap()
        textField.typeText("My Name a Jeff")
        let textView = app.textViews["DetailVCTextView"]
        XCTAssert(textView.exists)
        textView.tap()
        textView.typeText("My Name a Jeff ... but really ... XCTest")
        let sendButton = app.navigationBars["New Message"].buttons["Send"]
        XCTAssert(sendButton.exists)
        sendButton.tap()
        let messageCell = app.tables.staticTexts["My Name a Jeff"]
        XCTAssert(messageCell.exists)
        XCTAssertTrue(messageCell.label == "My Name a Jeff")
        let backButton = app.navigationBars["A New Thread"].buttons["λ Message Board"]
        backButton.tap()
        let thread = app.tables.staticTexts["Testing again"]
        XCTAssert(thread.exists)
        
    }
    
    
    
    func testTapMessageThread() {
        let app = XCUIApplication()
        let cell = app.tables.staticTexts["Testing again"]
        XCTAssert(cell.exists)
        cell.tap()
        XCTAssert(app.navigationBars["Testing again"].exists)
        XCTAssertFalse(app.navigationBars["λ Message Board"].exists)
    }

    

    
    func testAddingAMessageToThread() {
        let app = XCUIApplication()
        let cell = app.tables.staticTexts["Testing again"]
        XCTAssert(cell.exists)
        cell.tap()
        let addButton = app.navigationBars["Testing again"].buttons["Add"]
        XCTAssert(addButton.exists)
        addButton.tap()
        let textField = app.textFields["Enter your name:"]
        XCTAssert(textField.exists)
        textField.tap()
        textField.typeText("XCTesting2")
        let textView = app.textViews["DetailVCTextView"]
        XCTAssert(textView.exists)
        textView.tap()
        textView.typeText("XCTesting2 Message")
        let sendButton = app.navigationBars["New Message"].buttons["Send"]
        XCTAssert(sendButton.exists)
        sendButton.tap()
        let messageCell = app.tables.staticTexts["XCTesting2 Message"]
        XCTAssert(messageCell.exists)
        XCTAssertTrue(messageCell.label == "XCTesting2 Message")
    }
    
    func testInitial() {
        let app = XCUIApplication()
        XCTAssertTrue(app.tables.cells.count > 0)
    }
  
    
    
    
    
    
    
    
}
