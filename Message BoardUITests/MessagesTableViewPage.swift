//
//  MessagesTableViewPage.swift
//  Message BoardUITests
//
//  Created by Linh Bouniol on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessagesTableViewPage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    var messageTextField: XCUIElement {
        return app.textFields["Create a new thread:"]
    }
    
    func tableViewCell(at index: Int) -> XCUIElement {
        return app.tables.cells.element(boundBy: index)
    }
    
    // MARK: - Actions
    
    @discardableResult func tapMessageTextField(file: String = #file, line: UInt = #line) -> MessagesTableViewPage {
        testCase.expect(exists: messageTextField)
        messageTextField.tap()
        messageTextField.typeText("hello\n")
        return self
    }
    
    // MARK: - Verifications
    
    @discardableResult func verifyTableViewCell(at index: Int, file: String = #file, line: UInt = #line) -> MessagesTableViewPage {
        
        let cell = tableViewCell(at: index)
        testCase.expect(exists: cell, file: file, line: line)
//        cell.tap() // no need to tap it in verify
        return self
    }
}
