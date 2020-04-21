//
//  MessageThreadPage.swift
//  Message BoardUITests
//
//  Created by Jessie Ann Griffin on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadDetailTableViewPage: TestPage {

    let testCase: XCTestCase
    
    var tableView: XCUIElement {
        return app.tables.element(boundBy: 0)
    }
    
    var addMessageButton: XCUIElement {
        return app.navigationBars.buttons["MessageThreadDetailTableViewController.AddButton"]
    }
    
    func tableViewCell(at index: Int) -> XCUIElement {
        return tableView.cells.element(boundBy: index)
    }
    
    @discardableResult func tapOnAddMessageButton(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: addMessageButton, file: file, line: line)
        addMessageButton.tap()
        return MessageDetailPage(testCase: testCase)
    }

    @discardableResult func tapOnTableViewCell(at index: Int, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        let cell = tableViewCell(at: index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return MessageDetailPage(testCase: testCase)
    }
    
    @discardableResult func verifyMessageThreadDetailTableViewPageIsShowing(file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewPage {
        testCase.expect(exists: tableView, file: file, line: line)
        return self
    }
    
    @discardableResult func verifyTitleIs(title: String, file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewPage {
        let title = app.navigationBars[title]
        print(app)
        testCase.expect(exists: title, file: file, line: line)
        return self
    }
}


