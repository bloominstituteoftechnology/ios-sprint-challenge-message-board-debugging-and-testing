//
//  MessageThreadsPage.swift
//  Message BoardUITests
//
//  Created by Moses Robinson on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadsPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var messageThreadTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.TextField"]
    }
    
    private func messageThreadCell(at index: Int ) -> XCUIElement {
        return app.cells.element(boundBy: index)
    }
    
    // INteractions
    
    @discardableResult func createMessageThread() -> MessageThreadsPage {
        XCTAssert(messageThreadTextField.exists)
        messageThreadTextField.tap()
        messageThreadTextField.typeText("Something something test")
        messageThreadTextField.keyboards.buttons["Return"].tap()
        
        return self
    }
    
    
    // Verifications
    @discardableResult func verifyMessageThreadCell(at index: Int) -> MessageThreadsPage {
        let cell = messageThreadCell(at: index)
        XCTAssert(cell.exists)
        
        return self
    }
}
