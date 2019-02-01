//
//  ThreadPage.swift
//  Message BoardUITests
//
//  Created by Benjamin Hakes on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


import XCTest

struct ThreadPage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    private func threadCellFor(_ index: Int) -> XCUIElement {
        return app.tables.cells["MessageThreadsTableViewController.ThreadCell\(index)"]
        
    }
    
    var threadTitleTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.ThreadTitleTextField"]
    }
    
    // MARK: - Actions (interactions)
    
    
    @discardableResult func tapOnThreadsCell(at index: Int, file: String = #file, line: UInt = #line) -> MessagePage {
        
        let cell = threadCellFor(index)
        
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        
        let messagePage = MessagePage(testCase: testCase)
        
        return messagePage
        
    }
    
    @discardableResult func tapAndEnterTextOnThreadTitleTextField(with string: String, file: String = #file, line: UInt = #line) -> ThreadPage {
        
        testCase.expect(exists: threadTitleTextField, file: file, line: line)
        threadTitleTextField.tap()
        
        threadTitleTextField.typeText(string)
        
        return self
        
    }
    
    
    
    // MARK: - Verifications
    
    
    @discardableResult func verifyThreadsHaveLoaded(file: String = #file, line: UInt = #line) -> ThreadPage {
        
        let predicate = NSPredicate(format: "count > 0")
        
        testCase.expectation(for: predicate, evaluatedWith: app.tables.cells)
        testCase.waitForExpectations(timeout: 4, handler: nil)
        
        return self
        
    }

    
}

