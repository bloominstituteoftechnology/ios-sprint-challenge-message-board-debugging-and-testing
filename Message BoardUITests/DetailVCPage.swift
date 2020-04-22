//
//  DetailVCPage.swift
//  Message BoardUITests
//
//  Created by Nikita Thomas on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct DetailVCPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var backButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 0)
    }
    
    var newMessageButton: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    
    private func getMessage(at index: Int) -> XCUIElement {
        return app.tables.cells.element(boundBy: index)
    }
    
    
    // Interactions
    
    @discardableResult func tapBackButton() -> ThreadTVCPage {
        backButton.tap()
        return ThreadTVCPage(testCase: testCase)
    }
    
    @discardableResult func tapAddButton() -> NewMessagePage {
        newMessageButton.tap()
        return NewMessagePage(testCase: testCase)
    }

    
    // Verification
    
    @discardableResult func verifyMessageExists(at index: Int) -> DetailVCPage {
        let cell = getMessage(at: index)
        XCTAssert(cell.exists)
        return DetailVCPage(testCase: testCase)
    }
    
    
}
