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
    
    func testOpenMessageThread() {
        XCTAssert(app.tables.cells["MessageThreadCell"].exists)
        
        app.tables.cells.element(boundBy: 1).tap()
        
        XCTAssert(app.tables.cells["MessageCell"].exists)
    }
    
    
    
}
