//
//  ThreadsTableViewControllerPage.swift
//  Message BoardUITests
//
//  Created by Daniela Parra on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct ThreadsTableViewControllerPage: TestPage {
    
    
    // MARK: - Interactions
    
    // Add new thread
    @discardableResult func addNewThread() -> ThreadsTableViewControllerPage {
        threadTextField.tap()
        threadTextField.typeText("TestThread")
        app.keyboards.buttons["Return"].tap()
        return self
    }
    
    // View exisiting thread
    @discardableResult func seeThread(at index: Int) -> ThreadDetailTableViewControllerPage {
        let selectedCell = cell(index)
        selectedCell.tap()
        return ThreadDetailTableViewControllerPage(testCase: self.testCase, threadsTableViewControllerPage: self)
    }
    
    // MARK: - Verifications
    
    //Thread exists
    @discardableResult func verifyThreadExists(at index: Int) -> ThreadsTableViewControllerPage {
        let selectedCell = cell(index)
        testCase.expect(exists: selectedCell, file: #file, line: #line)
        return self
    }
    
    //Check thread title
    @discardableResult func verifyThread(at index: Int) -> ThreadsTableViewControllerPage {
        let selectedCell = cell(index)
        testCase.expect(true: selectedCell.isHittable, file: #file, line: #line)
        return self
    }
    
    // MARK: - Elements
    
    // Text field
    var threadTextField: XCUIElement {
        return app.tables.textFields["MessageThreadsTableViewController.ThreadTextField"]
    }
    
    // First cell
    func cell(_ index: Int) -> XCUIElement {
        return app.tables.cells.element(boundBy: index)
    }
    
    var testCase: XCTestCase
}
