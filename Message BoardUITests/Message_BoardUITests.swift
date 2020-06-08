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
    
    /// 4.3 Testing Navigation Between Screens
    
    func testNavigation() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["test"]/*[[".cells.staticTexts[\"test\"]",".staticTexts[\"test\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let testNavigationBar = app.navigationBars["test"]
        testNavigationBar.buttons["Add"].tap()
        app.navigationBars["New Message"].buttons["test"].tap()
        testNavigationBar.buttons["λ Message Board"].tap()
        
    }
    
}
