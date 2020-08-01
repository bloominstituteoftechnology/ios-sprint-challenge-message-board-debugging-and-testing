//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCancelMessage(){
        try! setUpWithError()
        app.tables.staticTexts["A New Thread"].tap()
        let NavigationBar = app.navigationBars["A New Thread"]
        let StaticText = NavigationBar.staticTexts["A New Thread"]
        StaticText.tap()
        NavigationBar.buttons["Add"].tap()
        app.navigationBars["New Message"].buttons["Cancel"].tap()
        StaticText.tap()
        XCTAssertEqual(StaticText.label, "A New Thread")
    }
    
    func testCreateMessage(){
        
    }
}
