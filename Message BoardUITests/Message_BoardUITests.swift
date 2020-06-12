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
    
    func testCreateThread() {
        setUpThread()
        
        XCTAssertTrue(app.staticTexts["hi"].exists)

    }
    
    func testCreateMessage() {
        setUpThread()
        
        app.tables.staticTexts["hi"].tap()
        
        navigateToAddMessage()
        
        setUpMessage()
        
        app.buttons["Send"].tap()
        
        XCTAssertTrue(app.staticTexts["Message"].exists)
    }
    
    func testCancel() {
        setUpThread()
        
        app.tables.staticTexts["hi"].tap()
        
        navigateToAddMessage()
        
        setUpMessage()
        
        app.buttons["Cancel"].tap()
        
        XCTAssertFalse(app.staticTexts["Message"].exists)
    }
    
    private func setUpThread() {
        app.launch()
        
        app.textFields["Create a new thread:"].tap()

        app.keys["h"].tap()
        app.keys["i"].tap()

        app.buttons["Return"].tap()
    }
    
    private func navigateToAddMessage() {
        app.buttons["Add"].tap()
    }
    
    private func setUpMessage() {
        app.textFields["Enter your name:"].tap()
        
        app.keys["V"].tap()
        app.keys["i"].tap()
        app.keys["n"].tap()
        app.keys["c"].tap()
        app.keys["e"].tap()
        app.keys["n"].tap()
        app.keys["t"].tap()
        
        app.textViews.element.tap()
        
        app.keys["M"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["s"].tap()
        app.keys["a"].tap()
        app.keys["g"].tap()
        app.keys["e"].tap()

    }
}
