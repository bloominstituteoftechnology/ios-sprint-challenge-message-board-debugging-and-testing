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
    
    var threadTyper: XCUIElement {
        return app.textFields.element(boundBy: 0)
    }
    
    var messageField: XCUIElement {
        return app.textFields["newMessageField"]
    }
    
    var messageView: XCUIElement {
        return app.textViews.element(boundBy: 0)
    }
    
    var tableView: XCUIElement {
        return app.tables.element(boundBy: 0)
    }
    
    func tableViewCell(at index: Int) -> XCUIElement {
        return tableView.cells.element(boundBy: index)
    }
    
    var rightNavigationButton: XCUIElement {
        return app.navigationBars.element(boundBy: 0).buttons.element(boundBy: 1)
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testExpectation() {
        
        threadTyper.tap()
        threadTyper.typeText("Testing this out")
        app.keyboards.buttons["Return"].tap()
        
        tableViewCell(at: 0).tap()
        rightNavigationButton.tap()
        
        threadTyper.tap()
     //   threadTyper.typeText("Testing this field")
        messageView.tap()
        messageField.typeText("Testing out the view")
        
        rightNavigationButton.tap()
        
        
        if let text = tableViewCell(at: 0).textFields.element(boundBy: 0).value as? String {
            XCTAssertEqual(text, "Testing this out")
        } else {
            print("NO GO")
        }
 
    }
    
    // This is for finding the missing .resume() call in the URLSession on func createMessageThread
    

    
    func createTheThread() {
        threadTyper.tap()
        threadTyper.typeText("Testing this out")
    }
    
}
