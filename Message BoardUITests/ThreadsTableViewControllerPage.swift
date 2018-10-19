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
    @discardableResult func seeThread() -> ThreadDetailTableViewControllerPage {
        firstCell.tap()
        return ThreadDetailTableViewControllerPage(testCase: self.testCase, threadsTableViewControllerPage: self)
    }
    
    // MARK: - Verifications
    
    //Thread exists
    @discardableResult func verifyThreadExists() -> ThreadsTableViewControllerPage {
        testCase.expect(exists: firstCell, file: #file, line: #line)
        return self
    }
    
    // MARK: - Elements
    
    // Text field
    var threadTextField: XCUIElement {
        return app.tables.textFields["MessageThreadsTableViewController.ThreadTextField"]
    }
    
    // First cell
    var firstCell: XCUIElement {
        return app.tables.cells["MessageThreadsTableViewController.ThreadCell"].firstMatch
    }
    
    var testCase: XCTestCase
}
