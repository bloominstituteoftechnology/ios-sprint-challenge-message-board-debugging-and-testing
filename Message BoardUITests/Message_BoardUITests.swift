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
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["HI"]/*[[".cells.staticTexts[\"HI\"]",".staticTexts[\"HI\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tapThread()
        let navagationBarTitle = app.navigationBars["HI"].staticTexts["HI"]
        
        XCTAssertEqual(navagationBarTitle.label, "HI")
    }
    
    func testSendingMessage() {
        let app = XCUIApplication()
//        app.tables.staticTexts["HI"].tap()
        tapThread()
//        app.navigationBars["HI"].buttons["Add"].tap()
        tappedAddButton()
        let nameTextField = app.textFields["Enter your name:"]
        nameTextField.tap()
        nameTextField.typeText("Rob")
        sendButtonTapped()
        
        XCTAssert(app.tables.cells.staticTexts["Rob"].exists)
    }
    func testCancelButtonTapped() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Create A New Thread"]/*[[".cells.staticTexts[\"Create A New Thread\"]",".staticTexts[\"Create A New Thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let createANewThreadNavigationBar = app.navigationBars["Create A New Thread"]
        createANewThreadNavigationBar.buttons["Add"].tap()
        app.navigationBars["New Message"].buttons["Cancel"].tap()
        
        XCTAssertEqual(createANewThreadNavigationBar.label, "")
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

