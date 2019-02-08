//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication = XCUIApplication()
    // MessageThreadsTableViewController
   
    //MessageThreadDetailTableViewController
    
    //MessageDetailViewController
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testExample() {
        let tablesQuery = app.tables
        tablesQuery.textFields["Create a new thread:"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["CHICKEN"]/*[[".cells.staticTexts[\"CHICKEN\"]",".staticTexts[\"CHICKEN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let chickenNavigationBar = app.navigationBars["CHICKEN"]
        chickenNavigationBar.buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        app.textViews.containing(.button, identifier:"Lab").element.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        chickenNavigationBar.buttons["λ Message Board"].tap()

    }
    
}
