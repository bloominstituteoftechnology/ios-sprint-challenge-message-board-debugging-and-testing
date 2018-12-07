//
//   MessageThreadTViewControllerTestPage.swift
//  Message BoardUITests
//
//  Created by Yvette Zhukovsky on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadTViewControllerTestPage: TestPage {
    var testCase: XCTestCase
    
    //Elements
    
    
    private func cellTitle(_ title: String) -> XCUIElement {
        return app.staticTexts[title]
    }
    
    func cellAt(index: Int)-> XCUIElement {
        return app.tables.element(boundBy: 0).cells.element(boundBy: index)
    }
    
    private var writingNewThread: XCUIElement {
        
        return app.textFields["MessageThreadsTableViewController.TextFieldNewThread"]
    }
    
   
    
    //Actions
    
    
    @discardableResult func tapOnCell(at index: Int)-> MessageThreadDetailTableVCTestPage {
        cellAt(index: index).tap()
        return  MessageThreadDetailTableVCTestPage(testCase: testCase)
    }
    
    @discardableResult func createNewThread(_ title: String)-> MessageThreadTViewControllerTestPage  {
        writingNewThread.tap()
        writingNewThread.typeText(title)
        writingNewThread.typeText("\n")
        return self
    }
    
    
    
    //Verifications
    
    @discardableResult func verifyingCell(_ title: String) -> MessageThreadTViewControllerTestPage {
        let cell = self.cellTitle(title)
        XCTAssertNotNil(cell)
        return self
    }
    
    @discardableResult func NavigationTitle(_ title: String = "λ Message Board") -> MessageThreadTViewControllerTestPage {
        let navBar = app.navigationBars.firstMatch
        XCTAssert(navBar.identifier == title)
        return self
    }
    
    
    
    
}
