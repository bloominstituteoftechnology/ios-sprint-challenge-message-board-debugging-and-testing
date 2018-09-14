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
        return app.staticTexts["MessageThreadsTableView.threadTitleTextField"]
    }
    
    func tableViewCell(for index: Int) -> XCUIElement {
        return app.tables.element(boundBy: 0).cells.element(boundBy: index)
    }
    
    
    // MARK: - Actions
    
    
    
    
    // MARK: - Verifications
    
    
}
