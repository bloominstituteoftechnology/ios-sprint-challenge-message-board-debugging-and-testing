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
        
        app = XCUIApplication()
        
       // app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testThreadCellCreatedAfterHittingEnterWithStringInTextField() {
        
        threadTextField.tap()
        threadTextField.typeText("New Thread\n")
        XCTAssertTrue(cellAt(0).exists)
        
    }
    
    // MARK: - Private Functions
    
    private func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.cells.element(boundBy: index)
        return cell
    }
    
    // MARK: - Variables
    
    private var threadTextField: XCUIElement {
        return app.textFields["MessageThreadTVC.TextField"]
    }
    
    var app: XCUIApplication!
}
