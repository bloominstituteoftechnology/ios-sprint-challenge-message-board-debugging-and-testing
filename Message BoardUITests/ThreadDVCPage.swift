//
//  ThreadDVCPage.swift
//  Message BoardUITests
//
//  Created by Jerrick Warren on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct ThreadDVCPage: TestPage {

   var testCase: XCTestCase

    // UI Elements
    
    var newMessage: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    
    private func retrieveMessage(at index: Int) -> XCUIElement {
        return app.tables.cells.element(boundBy: index)
    }
    
    var backButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 0)
    }
    
   
   
    
    // Interactions
    
    @discardableResult func tapBackButton() -> ThreadTVCPage {
        backButton.tap()
        return ThreadTVCPage(testCase: testCase)
    }
    
    @discardableResult func tapAddButton() -> ThreadMessagesPage {
        newMessage.tap()
        return ThreadMessagesPage(testCase: testCase)
    }
    
    
    // Verification
    
    @discardableResult func verifyMessageExists(at index: Int) -> ThreadDVCPage {
        let cell = retrieveMessage(at: index)
        XCTAssert(cell.exists)
        return ThreadDVCPage(testCase: testCase)
    }
    
    
    
}
