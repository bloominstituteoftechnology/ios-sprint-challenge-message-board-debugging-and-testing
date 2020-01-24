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
    
    func testSendButtonDismissesMessageDetailView() {
        
        let app = XCUIApplication()
        app.tables.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()
        let textField = app.textFields["Enter your name:"]
        textField.tap()
        textField.typeText("Chad \n")
        app.navigationBars["New Message"].buttons["Send"].tap()
        XCTAssert(app.navigationBars["A New Thread"].exists)
    }
}
