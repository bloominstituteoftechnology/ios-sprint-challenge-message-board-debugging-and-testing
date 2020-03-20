//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var threadTF: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    private var nameTF: XCUIElement {
        return app.textFields["Enter your name:"]
    }
    
    private var messageTV: XCUIElement {
        return app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
    }
    
    private var sendButton: XCUIElement {
        return app.navigationBars["New Message"].buttons["Send"]
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateThread() {
        threadTF.tap()
        threadTF.typeText("UITestThread")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards.buttons[\"Return\"]",".buttons[\"Return\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func openThread() {
        app.tables.staticTexts["UITestThread"].tap()
    }
    
    func testOpenThread() {
        openThread()
        app.navigationBars["UITestThread"].buttons["λ Message Board"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Fede"]/*[[".cells.staticTexts[\"Fede\"]",".staticTexts[\"Fede\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Fede"].buttons["λ Message Board"].tap()
    }
    
    func testCreateMessage() {
        openThread()
        app.navigationBars["UITestThread"].buttons["Add"].tap()
        nameTF.tap()
        nameTF.typeText("UITestMessage")
        messageTV.tap()
        messageTV.typeText("Meet me in the middle.")
        sendButton.tap()
        //XCTAssert(app.tables.staticTexts["UITestMessage"].exists)
    }
    
}
