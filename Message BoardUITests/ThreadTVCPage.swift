//
//  ThreadTVCPage.swift
//  Message BoardUITests
//
//  Created by Jerrick Warren on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct ThreadTVCPage: TestPage {
     var testCase: XCTestCase
    
    // Elements
    var textField: XCUIElement {
        return app.textFields["newThread.textField"]
    }
    
    func firstCell(at index: Int) -> XCUIElement {
        return app.tables.cells.element(boundBy: index)
    }
    
    // Inter(actions)
    
    // create new thread
    @discardableResult func createNewThread() -> ThreadTVCPage {
       XCTAssert(textField.exists)
        textField.tap()
        textField.typeText("TestThread")
        //app.keyboards.buttons["Return"].tap()
        return self
    }
    
    // make sure thread is actually there 
    @discardableResult func verifyCell(at index: Int) -> ThreadDVCPage {
        let cell = firstCell(at: 0)
        XCTAssert(cell.exists)
        cell.tap()
        return ThreadDVCPage(testCase: testCase)
    }
    
    
}
