//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    //MARK: - Properties
    var app: XCUIApplication!
    
    private var nextButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 1)
    }
    
    private var threadTextField: XCUIElement {
        return app.textFields["MessageThreadTVC.textField"]
    }
    
    //MARK: - Private Func
    private func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.cells.element(boundBy: index)
        return cell
    }
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testThreadCellCreatedAfterHittingEnterWithStringInTextField() {
        
        threadTextField.tap()
        threadTextField.typeText("New Thread")
        XCTAssertTrue(cellAt(0).exists)
        
    }
    
}
