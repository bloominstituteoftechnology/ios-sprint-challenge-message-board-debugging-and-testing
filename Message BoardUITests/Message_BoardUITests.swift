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
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    
    func testCancelMessage() {
     try! setUpWithError()
     
     app.tables.staticTexts["A New Thread"].tap()
     let NavigationBar = app.navigationBars["A New Thread"]
     let StaticText = NavigationBar.staticTexts["A New Thread"]
     StaticText.tap()
     NavigationBar.buttons["Add"].tap()
     app.navigationBars["New Message"].buttons["Cancel"].tap()
     StaticText.tap()
     XCTAssertEqual(StaticText.label, "A New Thread")
      
    }

    func testCreateNewMessage() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["A New Thread"].tap()
        
        let newThreadNavigationBar = app.navigationBars["A New Thread"]
        newThreadNavigationBar.buttons["Add"].tap()
        
        let newmessagetitletextfieldTextField = app/*@START_MENU_TOKEN@*/.textFields["newMessageTitleTextfield"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"newMessageTitleTextfield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        newmessagetitletextfieldTextField.tap()
        newmessagetitletextfieldTextField.tap()
        
        let newmessagetextviewTextView = app.textViews["newMessageTextView"]
        newmessagetextviewTextView.tap()
        newmessagetextviewTextView.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        newThreadNavigationBar.buttons["λ Message Board"].tap()
    }
    
    func testBackButton() {
        let app = XCUIApplication()
        
        app.tables.staticTexts["A New Thread"].tap()
        
        XCTAssertFalse(app.staticTexts["λ Message Board"].exists)
        app.buttons["λ Message Board"].tap()
        XCTAssert(app.staticTexts["λ Message Board"].exists)
    }
    
    func testSendButton() {
        let app = XCUIApplication()
        
        app.tables.staticTexts["A New Thread"].tap()
        
        let newThreadNavigationBar = app.navigationBars["A New Thread"]
        newThreadNavigationBar.buttons["Add"].tap()
        
        let newmessagetitletextfieldTextField = app/*@START_MENU_TOKEN@*/.textFields["newMessageTitleTextfield"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"newMessageTitleTextfield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        newmessagetitletextfieldTextField.tap()
        newmessagetitletextfieldTextField.tap()
        
        let newmessagetextviewTextView = app.textViews["newMessageTextView"]
        newmessagetextviewTextView.tap()
        newmessagetextviewTextView.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
    }
    
    func testThreadClickForward() {
        let app = XCUIApplication()
        
        app.tables.staticTexts["A New Thread"].tap()
        XCTAssertFalse(app.staticTexts["λ Message Board"].exists)
    }
    
}//
