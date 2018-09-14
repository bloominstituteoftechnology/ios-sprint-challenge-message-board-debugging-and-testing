//
//  MessageThreadPage.swift
//  Message BoardUITests
//
//  Created by Conner on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadPage: TestPage {
    let testCase: XCTestCase
    
    // MARK: - Elements
    func cellFor(_ index: Int) -> XCUIElement {
        return app.tables.cells.element(boundBy: index)
    }
    
    var newThreadTextField: XCUIElement {
        return app.textFields.element(boundBy: 0)
    }
    
    // MARK: - Actions
    
    @discardableResult func tapOnCell(cellIndex: Int, file: String = #file, line: UInt = #line) -> MessageThreadPage {
        let cell = cellFor(cellIndex)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return self
    }
    
    @discardableResult func pressEnter(file: String = #file, line: UInt = #line) -> MessageThreadPage {
        app.keyboards.buttons["Return"].tap()
        return self
    }
    
    // MARK: - Verifications
    @discardableResult func messageIs(_ label: String,
                                      index: Int,
                                      expectedMessage: String,
                                      file: String = #file,
                                      line: UInt = #line) -> Bool {
        return cellFor(index).staticTexts[label].label == expectedMessage
    }
}
