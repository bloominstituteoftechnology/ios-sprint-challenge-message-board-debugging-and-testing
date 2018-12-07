//
//  ThreadTVCPage.swift
//  Message BoardUITests
//
//  Created by Nikita Thomas on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct ThreadTVCPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var threadTextField: XCUIElement {
        return app.textFields["ThreadTVC.textField1"]
    }
    
    private func getCell(at index: Int ) -> XCUIElement {
        return app.tables.cells.element(boundBy: index)
    }
    
    // Interactions
    
    @discardableResult func createNewThread() -> ThreadTVCPage {
        XCTAssert(threadTextField.exists)
        threadTextField.tap()
        threadTextField.typeText("testNewThread\n")
        return self
    }
    
    
    
    // Verifications
    @discardableResult func verifyThreadCell(at index: Int) -> ThreadTVCPage {
        let cell = getCell(at: index)
        XCTAssert(cell.exists)
        return self
    }
    
    
}
