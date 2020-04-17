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
    lazy var firstCellLabel = app.tables.children(matching: .cell).allElementsBoundByIndex.first!.staticTexts.firstMatch.label
    lazy var aNewThreadCell = app.tables.staticTexts["A New Thread"]
    lazy var aNewThreadNavTitleLabel = app.navigationBars["A New Thread"].staticTexts["A New Thread"].label
    lazy var testingAgainCell = app.tables.staticTexts["Testing again"]
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
    
    func testOrderOfMessageThreads() {
        XCTAssertEqual(firstCellLabel, aNewThreadCell.label)
    }
    
    func testShowMessageThread() {
        aNewThreadCell.tap()
        XCTAssertEqual(aNewThreadNavTitleLabel, "A New Thread") // Make sure showing correct thread
    }
    
    func testNewMessage() {
        aNewThreadCell.tap()
        addMessageButton.tap()
        sendButton.tap()
        
        XCTAssertEqual(aNewThreadNavTitleLabel, "A New Thread") // Make sure we went back to correct thread
    }
}
