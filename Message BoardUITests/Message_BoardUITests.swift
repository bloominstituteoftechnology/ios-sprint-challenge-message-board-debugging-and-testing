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
    
    private var newThread: XCUIElement {
        app.textFields["MessageThreadTableView.CreateThread"]
    }
    private var addMessage: XCUIElement {
        app.buttons["MessageThreadTableView.AddMessage"]
    }
    private func getThreadFor(_ thread: String) -> XCUIElement {
        app.staticTexts[thread]
    }
    
    private var nameTextField: XCUIElement {
        app.textFields["MessageThreadDetailView.NameField"]
    }
    private var bodyTextView: XCUIElement {
        app.textViews["MessageThreadDetailView.BodyText"]
    }
    private var sendMessageButton: XCUIElement {
        app.buttons["Send"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreatingThread() {
        newThread.tap()
        newThread.typeText("New thread\n")
        
        XCTAssert(getThreadFor("New thread").exists)
    }
    
    func testCreatingMessage() {
        newThread.tap()
        newThread.typeText("New thread\n")
        
        getThreadFor("New thread").tap()
        
        addMessage.tap()
        
        nameTextField.tap()
        nameTextField.typeText("Hunter")
        
        bodyTextView.tap()
        bodyTextView.typeText("This is a body text")
        
        sendMessageButton.tap()
        
        XCTAssert(app.staticTexts["Hunter"].exists)
    }
}
