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
//        let textFieldExpectation = expectation(description: "Waiting for cell photo")
        testCell.tap()
    }
    
    func testAddingANewMessage() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["a"]/*[[".cells.staticTexts[\"a\"]",".staticTexts[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["a"].buttons["Add"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        app.textFields["Enter your name:"].tap()
        element.children(matching: .textView).element.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
