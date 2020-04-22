//
//  MessageDetailViewPage.swift
//  Message BoardUITests
//
//  Created by Madison Waters on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct MessageDetailViewPage: TestPage {
//MessageDetailView

    // Title
    // 2 Nav Bar Buttons
    
    // UI Elements
    var messageDetailViewController: XCUIElement {
        return app.tableRows["MessageDetailView"]
    }
    
    //MessageDetailViewController.TextField
    var messageTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.TextField"]
    }
    
    //MessageDetailViewController.TextView
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.TextView"]
    }
    
    // (Inter)Actions
    
    // Verifications
    
    var testCase: XCTestCase
}
