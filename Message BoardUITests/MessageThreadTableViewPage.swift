//
//  MessageThreadTableViewPage.swift
//  Message BoardUITests
//
//  Created by Carolyn Lea on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadTableViewPage: TestPage
{
    let testCase: XCTestCase
    
    var textField: XCUIElement
    {
        return app.textFields["MessageThreadsTableViewController.textField"]
    }
    
    var tableViewCell: XCUIElement
    {
        return app.tables.cells["MessageThreadCell"]
    }
    var data: XCUIElement
    {
        return app.staticTexts["UITesting"]
    }
    
    func tableViewCell(at index: Int) -> XCUIElement
    {
        return app.tables.cells.element(boundBy: index)
    }
    
    @discardableResult func tapIntoTextField(file: String = #file, line: UInt = #line) -> MessageThreadTableViewPage
    {
        testCase.expect(exists: textField, file: file, line: line)
        textField.tap()
        textField.typeText("Pets")
        return self
    }
    
    @discardableResult func tapOnTableViewCell(at index: Int, file: String = #file, line: UInt = #line) -> MessageThreadTableViewPage
    {
        let cell = tableViewCell(at: index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return self 
    }
    
    @discardableResult func loadData(file: String = #file, line: UInt = #line) -> MessageThreadTableViewPage
    {
        
        return self
    }
}
