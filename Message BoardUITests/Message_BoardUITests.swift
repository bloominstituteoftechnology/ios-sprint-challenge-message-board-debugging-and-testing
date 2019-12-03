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
    
    func testNewMessage() {
        
        let app = XCUIApplication()

        let helloThread = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Hello"]/*[[".cells.staticTexts[\"Hello\"]",".staticTexts[\"Hello\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let newMessageButton = app.navigationBars["Hello"].buttons["Add"]
        let nameTextField = XCUIApplication().textFields["Enter your name:"]
        
        helloThread.tap()
        newMessageButton.tap()
        XCTAssertEqual(nameTextField.label, "")
        
    }
    
}
