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

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func tableView(id: String) -> XCUIElement {
        let tableView = app.tables[id]
        XCTAssertTrue(app.tables[id].exists)
        return tableView
    }
    
    func testThreadCellLabel() {
  XCTAssertTrue(tableView(id: "ThreadTableView").cells.firstMatch.exists)
        
    }
    
    func testMessageCellLabel() {
    tableView(id: "ThreadTableView").cells.firstMatch.tap()
    XCTAssertTrue(tableView(id: "MessageTableView").cells.firstMatch.exists)
    }
    
    
}
