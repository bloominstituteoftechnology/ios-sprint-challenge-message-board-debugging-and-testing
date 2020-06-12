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
    
    var tableView: XCUIElement {
        app.tables.element(boundBy: 0)
        
        
    }
    
    private func tableViewCell(at index: Int) -> XCUIElement {
        return tableView.cells.element(boundBy: index)
    }
    
    var enterYourNameTextField: XCUIElement {
        return app.textFields["Enter your name:"]
    }
    
    var addButton: XCUIElement {
        app.navigationBars["Testing again"].buttons["Add"]
        
    }
    
    var sendButton: XCUIElement {
        
        app.navigationBars["New Message"].buttons["Send"]
    }
    
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    func testTransitionToDetail() {
        let testCell = tableViewCell(at: 0)
        testCell.tap()
        
    }
    
    func testAcessingToAddANewMessage() {
        let testCell = tableViewCell(at: 0)
        //        let textFieldExpectation = expectation(description: "Waiting for cell photo")
        testCell.tap()
        let sendButtont = app.navigationBars["Testing again"].buttons["Add"]
        sendButtont.tap()
    }

    
    func testAddingANewMessage() {
        let testCell = tableViewCell(at: 0)
        
        testCell.tap()
        addButton.tap()
        sendButton.tap()
    }
   
}
