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
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
      //  app.launchArguments = ["UITesting"]
        
        app.launch()
    
    }
    
    func testCreateMessage() {
       
        messageThreadCell.staticTexts["For real"].tap()
        app.navigationBars["For real"].buttons["Add"].tap()
        
        nameTextField.tap()
        nameTextField.typeText("Jocelyn")
     
        messageTextView.tap()
        messageTextView.typeText("Hello, I am here")
        
        app.navigationBars["New Message"].buttons["Send"].tap()
        
     /*   let realThread = messageThreadCell.staticTexts["For real"]
        
        messageThreadCell.tap() */
        
        expect(exists: messageCell.staticTexts["Jocelyn"])
       
    }
    
    func testCreateThread() {
        
        let uiThread = "UI Test 1"
        let newThreadField = app.tables.textFields["Create a new thread:"]
        newThreadField.tap()
        newThreadField.typeText(uiThread)
        app.keyboards.buttons["return"].tap()
        
        expect(exists: messageThreadCell.staticTexts[uiThread])
      
    }
    
    func testMessageThreadDetailView() {
        
        app.tables.staticTexts["Last new thread"].tap()
        
        expect(exists: messageCell.staticTexts["Everything works"])
        
        app.navigationBars["Last new thread"].buttons["λ Message Board"].tap()
      
    }
    
    func testFetchThreads() {
        
        let predicate = NSPredicate(format: "count > 0")
        
        let fetchedThreadExpectation = expectation(for: predicate, evaluatedWith: app.tables.cells, handler: nil)
        
        fetchedThreadExpectation.expectationDescription = "There should be more than 0 threads in the table view."
        
      
        waitForExpectations(timeout: 5)
       
        
    }
    
    var nameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.name"]
    }
    
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.message"]
    }
    
    var messageCell: XCUIElement {
        return app.cells["MessageThreadDetailTableViewController.messageCell"]
    }
    
    var messageThreadCell: XCUIElement {
        return app.cells["MessageThreadTableViewController.cell"]
    }
    
}
