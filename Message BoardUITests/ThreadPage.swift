//
//  ThreadPage.swift
//  Message BoardUITests
//
//  Created by Farhan on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct ThreadPage: TestPage {
    
    var testCase: XCTestCase
    
    // MARK:- UI Elements
    
    var newThreadField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.NewThreadField"]
    }
    
    func threadCellfor(_ index: Int) -> XCUIElement {
         return app.children(matching: .cell).element(boundBy: index)
    }
    
    // MARK:- Interactions
    
    @discardableResult func createThread(with text: String) -> ThreadPage {
        newThreadField.tap()
        newThreadField.typeText(text)
        app.buttons["Return"].tap()
        return self
    }
    
    @discardableResult func tapOnFirstVisibleCell() -> MessagePage {
        
        
        app.tables.staticTexts["TEST THREAD"].tap()
//        app.tableRows.cells.allElementsBoundByIndex.first?.tap()
        
//        if threadCellfor(0).isHittable {
//            threadCellfor(0).tap()
//        }
        return MessagePage(testCase: testCase)
    }
    
    @discardableResult func tryScroll() -> ThreadPage {
        app.swipeUp(); return self
    }
    
    // MARK:- Verifications
    
    @discardableResult func verifyThreadDisplayedInCells() -> ThreadPage {
        
        let cells = app.tableRows.cells.allElementsBoundByIndex
        
        for cell in cells {
            
            if cell.isHittable {
                assert(cell.textFields.allElementsBoundByIndex.count == 1)
            }
        }
        return self
    }
    
}
