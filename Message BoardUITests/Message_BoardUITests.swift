//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - Properties
    
    var app: XCUIApplication!
    
    lazy var firstMessageThreadCell = app.tables.staticTexts["A New Thread"]
    lazy var firstMessageThreadNavTitleLabel = app.navigationBars["A New Thread"].staticTexts["A New Thread"].label
    lazy var addMessageButton = app.navigationBars["A New Thread"].buttons["Add"]
    lazy var sendButton = app.navigationBars["New Message"].buttons["Send"]
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Tests
    
    func testNewMessage() {
        firstMessageThreadCell.tap()
        addMessageButton.tap()
        sendButton.tap()
        
        XCTAssertEqual(firstMessageThreadNavTitleLabel, "A New Thread") // Make sure we went back to thread
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.children(matching: .cell).element(boundBy: 1).staticTexts[""].tap()
    }
    
}
