//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    

    func testUINewThreadTextField() {
        // Test the cell text is the thread title
        let newThreadTextField = app.textFields["NewThreadTextField.TextField"]
        newThreadTextField.tap()
        // Enter the title for the new thread
        newThreadTextField.typeText("UI Test Thread")
        XCTAssertEqual(newThreadTextField.value as? String , "UI Test Thread")
   }
    
    func testUIEnterNewThreadName() {
        let newThreadTextField = app.textFields["NewThreadTextField.TextField"]
        newThreadTextField.tap()
        newThreadTextField.typeText("UI Test Thread")
    }
    
    // Get the cell
    func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.cells.element(boundBy: index)
        return cell
    }
    
    func testNewMessageThreadCreated() {
        // Get the text field
        let newThreadTextField = app.textFields["NewThreadTextField.TextField"]
        
        // Get the cell count
        let oldCellCount = app.cells.count
        
        // Create a new thread
        newThreadTextField.tap()
        newThreadTextField.typeText("New Message Thread\n")
        let newCellCount = app.cells.count
        
        // Confirm a new thread was created
        XCTAssertTrue(newCellCount > oldCellCount)
    }
    
    // Test Detail TVC Navigation
    func testDetailTVCNavigation() {
        let newThreadTextField = app.textFields["NewThreadTextField.TextField"]
        let detailBackButton = app.navigationBars.buttons.element(boundBy: 0)
        let detailAddButton = app.navigationBars.buttons.element(boundBy: 1)
        
        // Create a new thread
        newThreadTextField.tap()
        newThreadTextField.typeText("Test Detail TVC Navigation\n")
        
        // Go to the message detail board
        cellAt(0).tap()
        // Go back to TVC
        detailBackButton.tap()
      
        // Go to the message detail board
        cellAt(0).tap()
        // Go to message board
        detailAddButton.tap()
    }
    
    // Test Message TC Navigation
    func testMessageTCNavigation() {
        let newThreadTextField = app.textFields["NewThreadTextField.TextField"]
        let detailBackButton = app.navigationBars.buttons.element(boundBy: 0)
        let detailAddButton = app.navigationBars.buttons.element(boundBy: 1)
        
        // Create a new thread
        newThreadTextField.tap()
        newThreadTextField.typeText("Test Message VC Navigation\n")
        
        // Go to the message detail board
        cellAt(0).tap()
        // Go back to TVC
        detailBackButton.tap()
        
        // Go to the message detail board
        cellAt(0).tap()
        // Go to message board
        detailAddButton.tap()
    }
    
    // Test new message creation
    func testNewMessageCreation() {
        
        print(app)
    }
    
    
        
    
}
