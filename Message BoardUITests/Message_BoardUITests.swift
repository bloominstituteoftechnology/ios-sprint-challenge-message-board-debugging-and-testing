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
    
    var textField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.TextField"]
    }
    
    var navTitle: XCUIElement {
        return app.navigationBars["λ Message Board"].staticTexts["λ Message Board"]
    }
    
    var firstTableCell: XCUIElement {
        return app.tables.element(boundBy: 0)
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    
    func testFirstLaunch() {
        XCTAssertTrue(navTitle.exists)
        XCTAssertEqual(textField.placeholderValue!, "Create a new thread:")
    }
    
    
  
    
    
    
    
    
    
}
