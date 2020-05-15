//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication {
        XCUIApplication()
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
        
        //Make a thread
        
        
    }
    
    func testExample() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        
        //Testing Basic UI Functionality
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["FOR TESTING PURPOSES DO NOT DELETE"]/*[[".cells.staticTexts[\"FOR TESTING PURPOSES DO NOT DELETE\"]",".staticTexts[\"FOR TESTING PURPOSES DO NOT DELETE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let forTestingPurposesDoNotDeleteNavigationBar = app.navigationBars["FOR TESTING PURPOSES DO NOT DELETE"]
        forTestingPurposesDoNotDeleteNavigationBar.buttons["Add"].tap()
        app.navigationBars["New Message"].buttons["FOR TESTING PURPOSES DO NOT DELETE"].tap()
        forTestingPurposesDoNotDeleteNavigationBar.buttons["λ Message Board"].tap()
        
        
        
        
    }
    
    
    
}
