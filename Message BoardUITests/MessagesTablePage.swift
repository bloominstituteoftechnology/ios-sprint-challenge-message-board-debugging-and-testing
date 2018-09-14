//
//  MessagesTableViewPage.swift
//  Message BoardUITests
//
//  Created by Samantha Gatt on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessagesTablePage: TestPage {
    
    let testCase: XCTestCase
    
    
    // MARK: - Elements
    
    func tableViewCell(for index: Int) -> XCUIElement {
        return app.tables.element(boundBy: 0).cells.element(boundBy: index)
    }
    
    var addNewMessageBarButton: XCUIElement {
        // 0 should be back button
        return app.navigationBars.buttons.element(boundBy: 1)
    }
    
    
    // MARK: - Actions
    
    
    
    
    // MARK: - Verifications
    
    
}
