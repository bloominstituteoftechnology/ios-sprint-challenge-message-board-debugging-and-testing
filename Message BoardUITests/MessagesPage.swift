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
        return app.tables.element(boundBy: 0).cells.element(boundBy: index)
    }
    
    var addMessageButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 1)
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Verifications
    
    
    
}
