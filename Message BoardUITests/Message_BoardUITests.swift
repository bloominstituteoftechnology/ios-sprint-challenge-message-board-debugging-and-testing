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
    
    func testExample() {
        
        let emptyListTable = XCUIApplication().tables["Empty list"]
        emptyListTable.textFields["Create a new thread:"].tap()
        emptyListTable.tap()
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["hello"]/*[[".cells.staticTexts[\"hello\"]",".staticTexts[\"hello\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["hello"].buttons["Add"].tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        
//        let app = XCUIApplication()
//        app.textFields["Enter your name:"].tap()
//        app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        
    }
    
    func testCreateMessage() {
        MessagesTableViewPage(testCase: self)
        .tapMessageTextField()
        .verifyTableViewCell(at: 0)
    }
    
    func testSendMessage() {
        MessagesTableViewPage(testCase: self)
        .tapCell(at: 0)     // cell doesn't exist?
        .tapAddButton()
        .tapSendButton()
        .verifyTableViewCell(at: 0)
    }
    
    func testAppLaunch() {
        MessagesTableViewPage(testCase: self).verifyTableViewCell(at: 0) // cell doesn't exist?
    }
}
