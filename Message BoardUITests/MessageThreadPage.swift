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
    
    var addMessageButton: XCUIElement {
        return app.navigationBars.element(boundBy: 0).buttons["Add"]
    }
    
    var addMessageTextField: XCUIElement {
        return app.textFields["Enter your name:"]
    }
    
    var addMessageTextView: XCUIElement {
        return app.textViews.element(boundBy: 0)
    }
    
    var saveMessageButton: XCUIElement {
        return app.navigationBars["New Message"].buttons["Send"]
    }
    
    var currentNavigationBar: XCUIElement {
        return app.navigationBars.element(boundBy: 0)
    }
    
    // MARK: - Actions
    
    @discardableResult func tapOnCell(cellIndex: Int, file: String = #file, line: UInt = #line) -> MessageThreadPage {
        let cell = cellFor(cellIndex)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return self
    }
    
    @discardableResult func tapOnAddButton(file: String = #file, line: UInt = #line) -> MessageThreadPage {
        testCase.expect(exists: addMessageButton, file: file, line: line)
        addMessageButton.tap()
        return self
    }
    
    @discardableResult func tapOnSaveButton(file: String = #file, line: UInt = #line) -> MessageThreadPage {
        testCase.expect(exists: saveMessageButton, file: file, line: line)
        saveMessageButton.tap()
        return self
    }
    
    @discardableResult func tapOnNameTextField(file: String = #file, line: UInt = #line) -> MessageThreadPage {
        testCase.expect(exists: addMessageTextField, file: file, line: line)
        addMessageTextField.tap()
        return self
    }
    
    @discardableResult func tapOnMessageTextView(file: String = #file, line: UInt = #line) -> MessageThreadPage {
        testCase.expect(exists: addMessageTextView, file: file, line: line)
        addMessageTextView.tap()
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
