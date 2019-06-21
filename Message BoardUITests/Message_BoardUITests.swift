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
        
    // let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }


    func testThreadViewController() {

        threadTextField.tap()
        threadTextField.typeText("Please Work")
        textView.tap()
        textView.typeText("This is a test")

        cellAt(index: 0).tap()
        XCTAssertTrue(cellAt(index: 0).exists)
    }

    func testMainTextField() {

        mainTextField.tap()
        mainTextField.typeText("Testing 1, 2")

        XCTAssertTrue(cellAt(index: 0).exists)
    }



    private func cellAt(index: Int) -> XCUIElement {
        return app.cells.element(boundBy: index)

    }




    private var mainTextField: XCUIElement {
        return app.textFields["MainTextField"]
    }

    var app: XCUIApplication {
        return XCUIApplication()
    }

    private var threadTextField: XCUIElement {
        return app.textFields["ThreadTextField"]
    }

    private var textView: XCUIElement {
        return app.textViews["ThreadTextView"]
    }
    
}
