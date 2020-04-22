//
//  MessageThreadDetailPage.swift
//  Message BoardUITests
//
//  Created by Moses Robinson on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadDetailPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var plusButton: XCUIElement {
        return app.buttons["Add"]
    }
    
    var backButton: XCUIElement {
        return app.buttons.element(boundBy: 0)
    }
    
    private func messageCell(at index: Int) -> XCUIElement {
        return app.cells.element(boundBy: index)
    }
    
    // INteractions
    
    @discardableResult func tappedPlusButton() -> MessageDetailPage {
        plusButton.tap()
        
        return MessageDetailPage(testCase: testCase)
    }
    
    @discardableResult func tappedBackButton() -> MessageThreadsPage {
        backButton.tap()
        
        return MessageThreadsPage(testCase: testCase)
    }
    
    @discardableResult func tappedMessageCell(at index: Int) -> MessageDetailPage {
        messageCell(at: index).tap()
        
        return MessageDetailPage(testCase: testCase)
    }
    
    // Verifications
    
    @discardableResult func verifyMessageCell(at index: Int) -> MessageDetailPage {
        XCTAssert(messageCell(at: index).exists)
        
        return MessageDetailPage(testCase: testCase)
    }
    
}
