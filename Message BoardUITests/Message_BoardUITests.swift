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
    private var textView: XCUIElement {
        return app.textViews["MessageDetailViewController.TextView"]
    }
    
    
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testSegueToViewMessageThread() {
        
        let app = XCUIApplication()
        tapThread()
        let navagationBarTitle = app.navigationBars["HI"].staticTexts["HI"]
        
        XCTAssertEqual(navagationBarTitle.label, "HI")
    }
    
    func testSendingMessage() {
        let app = XCUIApplication()
        tapThread()
        tappedAddButton()
        let nameTextField = app.textFields["Enter your name:"]
        nameTextField.tap()
        nameTextField.typeText("Rob")
        sendButtonTapped()
        
        XCTAssert(app.tables.cells.staticTexts["Rob"].exists)
    }
    func testCancelButtonTapped() {
        
        
        let app = XCUIApplication()
        app.tables.children(matching: .cell).element(boundBy: 2).staticTexts["Where are you?"].tap()
        
        let navigationBar = app.navigationBars["Where are you?"]
        let StaticText = navigationBar.staticTexts["Where are you?"]
        navigationBar.buttons["Add"].tap()
        app.navigationBars["New Message"].buttons["Cancel"].tap()
        navigationBar.staticTexts["Where are you?"].tap()
      
        XCTAssertEqual(StaticText.label, "Where are you?")
    }
    
    //MARK: - Functions -
    
    func tapThread() {
        app.tables.staticTexts["HI"].tap()
    }
    
    func tappedAddButton() {
        app.navigationBars["HI"].buttons["Add"].tap()
    }
    
    func sendButtonTapped() {
        let newMessageNavigationBar = app.navigationBars["New Message"]
        let sendButton = newMessageNavigationBar.buttons["Send"]
        sendButton.tap()
    }
}

