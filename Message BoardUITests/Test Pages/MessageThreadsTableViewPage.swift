//
//  MessageThreadsTableViewPage.swift
//  Message BoardUITests
//
//  Created by Jason Modisett on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadsTableViewPage: TestPage {
    
    // MARK:- Accessibility identifiers enum
    
    enum Identifiers {
        static let threadTextField = "MessageThreadsTableViewController.ThreadTextField"
    }
    
    var testCase: XCTestCase
    
    
    // MARK:- UI elements
    
    var threadTextField: XCUIElement { return app.tables.textFields[Identifiers.threadTextField] }
    
    func cell(_ index: Int) -> XCUIElement { return app.tables.cells.containing(.cell, identifier: "\(index)").element }
    
    
    // MARK:- Interactions
    
    @discardableResult func addNewThread(with threadTitle: String) -> MessageThreadsTableViewPage {
        
        threadTextField.tap()
        threadTextField.typeText(threadTitle)
        
        app.keyboards.buttons["Return"].tap()
        
        return self
    }
    
    @discardableResult func tapCell(at index: Int) -> MessageThreadDetailTableViewPage {
        
        let selectedCell = cell(index)
        selectedCell.tap()
        
        return MessageThreadDetailTableViewPage(testCase: testCase, messageThreadsTableViewPage: self)
    }
    
    
    // MARK:- Verifications
    
    @discardableResult func verifyCellSelection(at index: Int) -> MessageThreadsTableViewPage {
        
        let selectedCell = cell(index)
        testCase.expect(exists: selectedCell, file: #file, line: #line)
        
        return self
    }
    
    @discardableResult func verifyThread(at index: Int = 0) -> MessageThreadsTableViewPage {
        
        let selectedCell = cell(index)
        testCase.expect(true: selectedCell.isHittable, file: #file, line: #line)
        
        return self
    }
    
}
