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

    func testMockDataInTableView() {

          let threadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
          XCTAssertEqual(app.tables.cells.count, 2)

          threadTextField.tap()
          threadTextField.typeText("This is a new thread name.")
          app.keyboards.buttons["Return"].tap()
          XCTAssertEqual(app.tables.cells.count, 3)
        
    }
}
