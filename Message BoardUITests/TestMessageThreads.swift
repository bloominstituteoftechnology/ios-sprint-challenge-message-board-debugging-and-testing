//
//  TestMessageThreads.swift
//  Message BoardUITests
//
//  Created by Madison Waters on 2/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct TestMessageThreads: TestPage {
    
    let testCase: XCTestCase
    
    private func threadsCell(_ index: Int) -> XCUIElement {
        return app.tables.cells["MessageThreadsTableViewController.MessageThreadCell\(index)"]
    }
    
    var threadsTitleTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.ThreadTitleTextField"]
    }
    
    var threadsTableView: XCUIElement {
        return app.tables.containing(.cell, identifier:"MessageThreadsTableViewController.MessageThreadCell0").element
    }
    
    @discardableResult func AddTextTitleTextField(with string: String, file: String = #file, line: UInt = #line) -> TestMessageThreads {
        
        testCase.expect(exists: threadsTitleTextField, file: file, line: line)
        threadsTitleTextField.tap()
        threadsTitleTextField.typeText(string)
        threadsTitleTextField.typeText("\n")
        
        return self
    }
    
    @discardableResult func tapOnThreadsCell(at index: Int, file: String = #file, line: UInt = #line) -> MessageTestsPage {
        
        let cell = threadsCell(index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        
        let messageTestsPage = MessageTestsPage(testCase: testCase)
        return messageTestsPage
    }

}
