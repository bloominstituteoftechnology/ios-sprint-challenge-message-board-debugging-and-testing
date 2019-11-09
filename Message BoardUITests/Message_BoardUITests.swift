//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var newThreadTextField: XCUIElement {
        return app.textFields["createNewThread"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateMessageThread() {
        let threadTableView = app.tables.firstMatch
        XCTAssertTrue(threadTableView.exists)
    }
    
}
