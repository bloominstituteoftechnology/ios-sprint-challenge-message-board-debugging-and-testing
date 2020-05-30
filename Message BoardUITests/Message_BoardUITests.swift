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
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // I add sleeps so that it doesn't run so fast and I can see what the test is doing.
    func testSegueToDetailTableViewController() {
        app.tables.staticTexts["A New Thread"].tap()
        sleep(2)
    }
    
    func testSegueToDetailViewController() {
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()
    }
    
    func testSendingMessage() {
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()

        let lKey = app.keys["l"]
        lKey.tap()

        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        
        
        app.keys["T"].tap()

        app.navigationBars["New Message"].buttons["Send"].tap()
        
    }
}
