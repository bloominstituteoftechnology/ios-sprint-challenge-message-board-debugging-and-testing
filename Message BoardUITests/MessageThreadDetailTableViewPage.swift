//
//  MessageThreadDetailTableViewPage.swift
//  Message BoardUITests
//
//  Created by Carolyn Lea on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadDetailTableViewPage: TestPage
{
    let testCase: XCTestCase
    
    var tableview: XCUIElement
    {
        return app.tables.element
    }
    
    func tableViewCell(for index: Int) -> XCUIElement
    {
        return tableview.cells.element(boundBy: index)
    }
    
    var navigationElement: XCUIElement {
        return app.navigationBars.element(boundBy: 0)
    }
    
    var navigationBarButton: XCUIElement {
        return navigationElement.buttons.element(boundBy: 1)
    }
    
    var nameTextField: XCUIElement {
        return app.textFields.element(boundBy: 0)
    }
    
    var messageTextField: XCUIElement {
        return app.textViews.element(boundBy: 0)
    }
    
    @discardableResult func tapOnCell(for index: Int, file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewPage {
        let cell = tableViewCell(for: index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return MessageThreadDetailTableViewPage(testCase: testCase)
    }
    
    
}
