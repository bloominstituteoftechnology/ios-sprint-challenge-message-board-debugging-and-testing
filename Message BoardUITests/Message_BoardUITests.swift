//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - Helper Prorperties
    
    var app: XCUIApplication!
    
    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.TurnLabel"]
    }

    // MARK: - Test Setup

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Tests
    
    func testSaveButtonInMessageDetail() throws {
        
        app.textFields["ThreadsTV.CreateTextField"].tap()
        app.textFields["ThreadsTV.CreateTextField"].typeText("New Entry")
        app.keyboards.buttons["Return"].tap()
        
        app.tables.cells["0"].tap()
        app.navigationBars["A"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()

//        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
//        textView.tap()
//        textView.tap()
//        app.navigationBars["New Message"].buttons["Send"].tap()
                
    }
    
}
