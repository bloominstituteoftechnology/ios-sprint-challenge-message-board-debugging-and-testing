//
//  MessagePage.swift
//  Message BoardUITests
//
//  Created by Benjamin Hakes on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


import XCTest

struct MessagePage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    private func threadCellFor(_ index: Int) -> XCUIElement {
        return app.tables.cells["MessageThreadsTableViewController.ThreadCell\(index)"]
        
    }
    
    private func messageCellFor(_ index: Int) -> XCUIElement {
        return app.tables.cells["MessageThreadDetailTableViewController.MessageCell\(index)"]
        
    }
    
    var threadTitleTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.ThreadTitleTextField"]
    }
    
    var addButton: XCUIElement {
        return app.navigationBars.buttons["add"]
    }
    
    var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    
    
    // MARK: - Actions (interactions)
    
    @discardableResult func tapAndEnterTextOnThreadTitleTextField(with string: String, file: String = #file, line: UInt = #line) -> MessagePage {
        
        testCase.expect(exists: threadTitleTextField, file: file, line: line)
        threadTitleTextField.tap()
        
        threadTitleTextField.typeText(string)
        
        return self
        
    }
    
    @discardableResult func tapOnThreadCell(at index: Int, file: String = #file, line: UInt = #line) -> MessagePage {
        
        let cell = threadCellFor(index)
        
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        
        return self
        
    }

    
    
    // MARK: - Verifications
    
    
    @discardableResult func verifyThreadsHaveLoaded(file: String = #file, line: UInt = #line) -> MessagePage {

        let predicate = NSPredicate(format: "count > 0")

        testCase.expectation(for: predicate, evaluatedWith: app.tables.cells)
        testCase.waitForExpectations(timeout: 4, handler: nil)

        return self

    }
    
    @discardableResult func verifyMessagesHaveLoaded(file: String = #file, line: UInt = #line) -> MessagePage {
        
        let predicate = NSPredicate(format: "count > 0")
        
        testCase.expectation(for: predicate, evaluatedWith: app.tables.cells)
        testCase.waitForExpectations(timeout: 4, handler: nil)
        
        return self
        
    }
    
}

