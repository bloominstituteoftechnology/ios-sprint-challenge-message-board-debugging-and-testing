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
    
    // MARK: - ENUM Identifier
    enum Identifier: String {
        case threadsCellLabel = "MessageThreadsTableViewController.CellTitleLabel"
        case newThreadTextField = "ThreadTableViewController.NewThreadTextField"
        case newMessageNameTextField = "NewMessageVC.NameTextField"
        case newMessageNameTextArea = "NewMessageVC.NameTextArea"
        case messageThreadCellNameLabel = "MessageThreadDetailTableViewController.CellTitleLabel"
        case messageThreadMessageLabel = "MessageThreadDetailTableViewController.CellSubtitleLabel"
    }
    
    var app: XCUIApplication!
    
    
    func textField(forID id: Identifier) -> XCUIElement {
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
