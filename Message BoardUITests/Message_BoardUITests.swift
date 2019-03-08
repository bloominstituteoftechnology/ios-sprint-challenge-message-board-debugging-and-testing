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
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testMessageThreadTVCTextField() {
        
        threadTextField.tap()
        threadTextField.typeText("New Thread\n")
        XCTAssertTrue(cellAt(0).exists)
    }
    
    func testMessageThreadTVCPersistsBetweenViews() {
        
        threadTextField.tap()
        threadTextField.typeText("New Thread\n")
        cellAt(0).tap()
        backButton.tap()
        XCTAssertTrue(cellAt(0).exists)
    }
    
    // MARK: - Private
    
    private func cellAt(_ index: Int) -> XCUIElement {
        
        return app.textFields["MessageThreadTVC.textField"]
    }
    
    private var backButton: XCUIElement {
        return app.navigationBars.element(boundBy: 0)
    }
    
    // MARK: - Properties
    
    private var threadTextField: XCUIElement {
        return app.textFields["MessageThreadTVC.textField"]
    }
    
    var app: XCUIApplication!
    
}
