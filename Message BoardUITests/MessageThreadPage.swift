//
//  MessageThreadPage.swift
//  Message BoardUITests
//
//  Created by Lisa Sampson on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadPage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    func threadCell(at index: Int) -> XCUIElement {
        return app.tables.element(boundBy: 0).cells.element(boundBy: index)
    }
    
    var textField: XCUIElement {
        return app.textFields.staticTexts["MessageThreadsTableViewController.TextField"]
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Verifications
    
    
    
}
