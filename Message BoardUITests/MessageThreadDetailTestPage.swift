//
//  MessageThreadDetailTestPage.swift
//  Message BoardUITests
//
//  Created by Sean Hendrix on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadDetailTestPage: TestPage {
    var testCase: XCTestCase
    let parent: MessageThreadTestPage
    let title: String
    
    // MARK: - UI Elements
    private var backButton: XCUIElement {
        return app.buttons["λ Message Board"]
    }
    
    private var addMessageButton: XCUIElement {
        return app.buttons["Add"]
    }
    
    private func cell(_ title: String) -> XCUIElement {
        return app.staticTexts[title]
    }
    
    // MARK: - Actions
    @discardableResult func tapBackButton(file: String = #file, line: UInt = #line) -> MessageThreadTestPage {
        testCase.expect(exists: backButton, file: file, line: line)
        backButton.tap()
        return parent
    }
    
    @discardableResult func tapAddButton(file: String = #file, line: UInt = #line) -> MessageDetailTestPage {
        testCase.expect(exists: addMessageButton, file: file, line: line)
        addMessageButton.tap()
        return MessageDetailTestPage(testCase: testCase, parent: self)
    }
    
    // MARK: - Verifications
    @discardableResult func cellExists(_ title: String, file: String = #file, line: UInt = #line) -> MessageThreadDetailTestPage {
        let cell = self.cell(title)
        testCase.expect(exists: cell, file: file, line: line)
        return self
    }
    
    @discardableResult func titleDisplays(_ title: String, file: String = #file, line: UInt = #line) -> MessageThreadDetailTestPage {
        let navBar = app.navigationBars.firstMatch
        testCase.expect(navBar.identifier, equals: title, file: file, line: line)
        return self
    }
    
    
    @discardableResult func numberOfCellsIs(_ number: Int, file: String = #file, line: UInt = #line) -> MessageThreadDetailTestPage {
        testCase.expect(app.cells.count, equals: number, file: file, line: line)
        return self
    }
}
