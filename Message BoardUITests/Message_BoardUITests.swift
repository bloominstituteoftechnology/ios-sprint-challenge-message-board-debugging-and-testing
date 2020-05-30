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
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testTableViewUpdatingWithThread() {
        let textField = XCUIApplication().tables["Empty list"].textFields["Create a new thread:"]
        textField.tap()
        textField.typeText("Blah")
        
        let app = XCUIApplication()
        app.tables["Empty list"].textFields["Create a new thread:"].tap()
        let tableViewText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Blah"]/*[[".cells.staticTexts[\"Blah\"]",".staticTexts[\"Blah\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tableViewText.tap()
        
       
        XCTAssertTrue(textField.staticTexts == tableViewText)
                                
    }
}
