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
    enum Identifier: String {
        case cellLabel = "MessageThreadsTableViewController.CellTitleLabel"
    }
    
    var app: XCUIApplication!
    
    func label(forId id: Identifier) -> XCUIElement {
        return app.staticTexts[id.rawValue]
    }
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCellHasLabel() {
        let cellLabel = label(forId: .cellLabel)
        XCTAssert(cellLabel.exists)
    }
    
}
