//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var createTextField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    private var enterNameField: XCUIElement {
        return app.textFields["MessageDetailViewController.NameTextField"]
    }
    
    
    private var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextVIew"]
    }
    
}
