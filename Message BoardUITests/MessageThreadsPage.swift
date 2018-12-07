//
//  MessageThreadsPage.swift
//  Message BoardUITests
//
//  Created by Moses Robinson on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadsPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var messageThreadTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.TextField"]
    }
    
    // INteractions
    
    
    // Verifications
    
}
