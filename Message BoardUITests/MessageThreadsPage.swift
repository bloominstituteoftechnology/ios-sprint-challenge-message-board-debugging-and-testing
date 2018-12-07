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
        messageThreadTextField.typeText("Something something test\n")
    //  messageThreadTextField.keyboards.buttons["return"].tap()
        
        return self
    }
    
    @discardableResult func tappedMessageThreadCell(at index: Int) -> MessageThreadDetailPage {
        messageThreadCell(at: index).tap()
        
        return MessageThreadDetailPage(testCase: testCase)
    }
    
    
    // Verifications
    @discardableResult func verifyMessageThreadCell(at index: Int) -> MessageThreadsPage {
        XCTAssert(messageThreadCell(at: index).exists)
        
        return self
    }
}
