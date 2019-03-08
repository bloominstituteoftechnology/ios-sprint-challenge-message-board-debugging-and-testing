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
    
    private var backButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 0)
    }
    
    private var nextButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 1)
    }

    private var messageTextView: XCUIElement {
        return app.textViews["MessageViewController.TextView"]
    }
    
    private var messageTextField: XCUIElement {
        return app.textFields["MessageViewController.TextField"]
    }
    
    private var messageThreadTextField: XCUIElement {
    return app.textFields["NewThreadTableViewController.TextField"]
    }
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
  
    
   func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.cells.element(boundBy: index)
        return cell
    }
    
    func testCreateCellAndCheckCellForExistingText() {
        messageThreadTextField.tap()
        messageThreadTextField.typeText("Testing Thread\n")
        XCTAssertTrue(cellAt(0).exists)
     
    }
}
