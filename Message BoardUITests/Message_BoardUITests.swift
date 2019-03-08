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
    
    var backButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 1)
    }
    
    var threadTextField: XCUIElement {
        return app.textFields["MessageThreadTVC.TextField"]
    }
    
    var messageTextField: XCUIElement {
        return app.textFields["MessageDetailVC.TextField"]
    }
    
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailVC.TextView"]
    }
    
    
    override func setUp() {
        super.setUp()
        
        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    //MARK: - Private Func
    private func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.cells.element(boundBy: index)
        return cell
    }
        
    func testThreadCellCreatedAfterHittingEnterWithStringInTextField() {
        threadTextField.tap()
        threadTextField.typeText("New Thread\n")
        XCTAssertTrue(cellAt(0).exists)
        
    }
    
    func testThreadCellStillExistsAfterTappingCellAndBack() {
        threadTextField.tap()
        threadTextField.typeText("New Thread\n")
        cellAt(0).tap()
        backButton.tap()
        XCTAssertTrue(cellAt(0).exists)
        
    }
    

    
}
