//
//  MessagesTableViewPage.swift
//  Message BoardUITests
//
//  Created by Samantha Gatt on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessagesTablePage: TestPage {
    
    let testCase: XCTestCase
    
    
    // MARK: - Elements
    
    func tableViewCell(for index: Int) -> XCUIElement {
        return app.tables.element(boundBy: 0).cells.element(boundBy: index)
    }
    
    var addNewMessageBarButton: XCUIElement {
        // 0 should be back button
        return app.navigationBars.buttons.element(boundBy: 1)
    }
    
    var title: String {
        return app.navigationBars.element(boundBy: 0).identifier
    }
    
    
    // MARK: - Actions
    
    @discardableResult func tapOnAddBarButton(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: addNewMessageBarButton, file: file, line: line)
        addNewMessageBarButton.tap()
        return MessageDetailPage(testCase: testCase)
    }
    
    
    // MARK: - Verifications
    
    @discardableResult func verfiyTitle(forThread text: String, file: String = #file, line: UInt = #line) -> MessagesTablePage {
        testCase.expect(title, equals: text, file: file, line: line)
        return self
    }
    
    @discardableResult func verifyCellWasCreated(with text: String, file: String = #file, line: UInt = #line) -> MessagesTablePage {
        let cell = app.tables.element(boundBy: 0).cells.staticTexts[text]
        testCase.expect(exists: cell, file: file, line: line)
        return self
    }
}
