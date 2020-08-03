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
    
      func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }



    func testCreateThread() {

     try! setUpWithError()

        let newThreadTextField = XCUIApplication().tables.textFields["Create new message thread"]
        newThreadTextField.tap()

        newThreadTextField.typeText("Test New Thread")
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.tables.cells.staticTexts["Test New Thread"].exists)
    }

}
