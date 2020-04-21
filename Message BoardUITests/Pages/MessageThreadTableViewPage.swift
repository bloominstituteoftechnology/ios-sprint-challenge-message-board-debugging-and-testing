//
//  MessageThreadPage.swift
//  Message BoardUITests
//
//  Created by Jessie Ann Griffin on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadTableViewPage: TestPage {

    let testCase: XCTestCase
    
    var tableView: XCUIElement {
        return app.tables.element(boundBy: 0)
    }
    
    var addThreadTextField: XCUIElement {
        return app.navigationBars.textFields["MessageThreadsTableViewController.CreateThread"]
    }
    
    func tableViewCell(at index: Int) -> XCUIElement {
        return tableView.cells.element(boundBy: index)
    }
    
    @discardableResult func tapOnTableViewCell(at index: Int, file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewPage {
        let cell = tableViewCell(at: index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return MessageThreadDetailTableViewPage(testCase: testCase)
    }
    
    @discardableResult func verifyMessageThreadTableViewPageIsShowing(file: String = #file, line: UInt = #line) -> MessageThreadTableViewPage {
        testCase.expect(exists: tableView, file: file, line: line)
        return self
    }
    
    @discardableResult func verifyTitleIs(title: String, file: String = #file, line: UInt = #line) -> MessageThreadTableViewPage {
        let title = app.navigationBars[title]
        print(app)
        testCase.expect(exists: title, file: file, line: line)
        return self
    }
}


