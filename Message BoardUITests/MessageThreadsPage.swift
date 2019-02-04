//
//  MessageThreadsPage.swift
//  Message BoardUITests
//
//  Created by Austin Cole on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadsPage: TestPage {
    
    let testCase: XCTestCase
    
    // Elements
    
    func getCertainCell(index: Int) -> XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: 0)
    }
    var threadTextField: XCUIElement {
        return app.tables.textFields["Create a new thread:"]
    }
    
    // Interactions
    
    @discardableResult func typeInTextField(file: String = #file, line: UInt = #line) -> MessageThreadsPage {
        testCase.expect(exists: threadTextField, file: file, line: line)
        threadTextField.tap()
        threadTextField.typeText("Hello")
        return self
    }
    
    @discardableResult func tapOnCell(index: Int, file: String = #file, line: UInt = #line) -> MessageThreadsPage {
        testCase.expect(exists: getCertainCell(index: index), file: file, line: line)
        getCertainCell(index: 0).tap()
        return self
    }
    // Verifications
    
}
