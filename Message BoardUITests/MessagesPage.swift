//
//  MessagesPage.swift
//  Message BoardUITests
//
//  Created by Lisa Sampson on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessagesPage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    func messageCell(at index: Int) -> XCUIElement {
        return app.tableRows.cells.element(boundBy: index)
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Verifications
    
    
    
}
