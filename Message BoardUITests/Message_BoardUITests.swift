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
    
    
    func testAddingMessage() {
        MessagesPage(testCase: self)
        .tapOnSearchBar()
        .typeInSearchBar("Test 1")
    }
    
    func testClickingOnACell() {
        let label = XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Test"]/*[[".cells.staticTexts[\"Test\"]",".staticTexts[\"Test\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        if label.waitForExistence(timeout: 10) {
            label.tap()
        }
        
        
    }
}
