//
//  MessageThreadTableViewPage.swift
//  Message BoardUITests
//
//  Created by Samantha Gatt on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadsTablePage: TestPage {
    
    let testCase: XCTestCase
    
    
    // MARK: - Elements
    
    var createThreadTextField: XCUIElement {
        return app.textFields["MessageThreadsTableView.threadTitleTextField"]
    }
    
    func tableViewCell(for index: Int) -> XCUIElement {
        return app.tables.element(boundBy: 0).cells.element(boundBy: index)
    }

    
    // MARK: - Actions
    
    @discardableResult func createThread(withTitle text: String, file: String = #file, line: UInt = #line) -> MessageThreadsTablePage {
        testCase.expect(exists: createThreadTextField, file: file, line: line)
        createThreadTextField.tap()
        createThreadTextField.typeText(text)
        app.keyboards.buttons["Return"].tap()
        return self
    }
    
    @discardableResult func tapOnCell(at index: Int, file: String = #file, line: UInt = #line) -> MessagesTablePage {
        let cell = tableViewCell(for: index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return MessagesTablePage(testCase: testCase)
    }
    
    
    // MARK: - Verifications
    
    @discardableResult func verifyCellWasCreated(for text: String, file: String = #file, line: UInt = #line) -> MessageThreadsTablePage {
        let cell = app.tables.element(boundBy: 0).cells.staticTexts[text]
        testCase.expect(exists: cell, file: file, line: line)
        return self
    }
}
