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
        case threadsCellLabel = "MessageThreadsTableViewController.CellTitleLabel"
        case threadDetailCellTitleLabel = "MessageThreadDetailTableViewController.CellTitleLabel"
        case newThreadTextField = "ThreadTableViewController.NewThreadTextField"
    }
    
    var app: XCUIApplication!
    
    func label(forId id: Identifier) -> XCUIElement {
        return app.staticTexts[id.rawValue]
    }
    
    func textField(forId id: Identifier) -> XCUIElement {
        return app.textFields[id.rawValue]
    }
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testNewMessage() {
        let newThreadTextField = textField(forId: .newThreadTextField)
        newThreadTextField.tap()
        newThreadTextField.typeText("Local Test")
        app.keyboards.buttons["Return"].tap()
        
        let threadsCellLabel = label(forId: .threadsCellLabel)
        XCTAssert(threadsCellLabel.exists)
    }
    
    
    

            
            
        
    }
