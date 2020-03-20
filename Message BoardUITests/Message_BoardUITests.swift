//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - ENUM Identifier
    enum Identifier: String {
        case cellLabel = "MessageThreadsTableViewController.CellTitleLabel"
    }
    
    var app: XCUIApplication!
    
    
    func label(forID id: Identifier) -> XCUIElement {
        return app.staticTexts[id.rawValue]
    }
    
    // MARK: - Setup Function
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Tests
    
}
