//
//  MessagePage.swift
//  Message BoardUITests
//
//  Created by Farhan on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct MessagePage: TestPage {
    
    var testCase: XCTestCase
    
    // MARK:- UI Elements
    var addNewMessageButton: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    
    // MARK:- Interactions
    
    @discardableResult func goToNewMessageScreen() -> NewMessagePage {
        
        addNewMessageButton.tap()
        return NewMessagePage(testCase: testCase)
    }
    
    // MARK:- Verifications
    
    @discardableResult func verifyMessagesDisplayedInCells() -> MessagePage {
        
        let cells = app.tables.cells.allElementsBoundByIndex
        
        for cell in cells {
            
            if cell.isHittable {
                assert(cell.textFields.allElementsBoundByIndex.count == 1)
            }
        }
        return self
    }
    
}
