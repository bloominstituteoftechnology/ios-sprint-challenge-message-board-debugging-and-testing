//
//  MessageThreadsDetailPage.swift
//  Message BoardUITests
//
//  Created by Austin Cole on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadsDetailPage: TestPage {
    
    let testCase: XCTestCase
    
    // Elements
    
    func getCertainCell(index: Int) -> XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: 0)
    }
    var addButton: XCUIElement {
    return app.navigationBars.buttons["Add"]
    }
    var backButton: XCUIElement {
        return app.navigationBars.buttons["λ Message Board"]
    }
    // Interactions
    
    @discardableResult func tapOnCell(index: Int, file: String = #file, line: UInt = #line) -> MessageThreadsDetailPage {
        testCase.expect(exists: getCertainCell(index: index))
        getCertainCell(index: 0).tap()
        return self
    }
    @discardableResult func tapOnAddButton(file: String = #file, line: UInt = #line) -> MessageThreadsDetailPage {
        testCase.expect(exists: addButton)
        addButton.tap()
        return self
    }
    @discardableResult func tapOnBackButton(file: String = #file, line: UInt = #line) -> MessageThreadsDetailPage {
        testCase.expect(exists: backButton)
        backButton.tap()
        return self
    }
    
    // Verifications
    
}
