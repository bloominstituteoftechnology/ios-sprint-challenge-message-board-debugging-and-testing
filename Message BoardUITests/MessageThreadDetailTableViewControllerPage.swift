//
//  MessageThreadDetailTableViewControllerPage.swift
//  Message BoardUITests
//
//  Created by Linh Bouniol on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadDetailTableViewControllerPage: TestPage {
    
    let testCase: XCTestCase
    
    // elemtents
    
    var addButton: XCUIElement {
        return app.buttons["Add"]
    }
    
    func tableViewCell(at index: Int) -> XCUIElement {
        return app.tables.cells.element(boundBy: index)
    }
    
    // actions
    
    @discardableResult func tapAddButton(file: String = #file, line: UInt = #line) -> MessageDetailViewControllerPage {
        testCase.expect(exists: addButton)
        addButton.tap()
        return MessageDetailViewControllerPage(testCase: testCase) // going to the next screen
    }
    
    // verify
    
    @discardableResult func verifyTableViewCell(at index: Int, file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewControllerPage {
        
        let cell = tableViewCell(at: index)
        testCase.expect(exists: cell, file: file, line: line)
        return self
    }
}
