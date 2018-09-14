//
//  MessagePage.swift
//  Message BoardUITests
//
//  Created by David Doswell on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessagePage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - MessageThreadsTableViewController
    
    private func textField() -> XCUIElement {
        return app.textFields["MessageThreadsTableViewController.ThreadTextField"]
    }
    
    private func messageThreadCell() -> XCUIElement {
        return app.cells["MessageThreadsTableViewController.MessageThreadCell"]
    }
    
    
    // MARK: - Actions
    @discardableResult func textFieldEngaged(file: String = #file, line: UInt = #line) -> MessagePage {
        testCase.expect(exists: textField(), file: file, line: line)
        return self
    }
    
    @discardableResult func cellTapped(file: String = #file, line: UInt = #line) -> MessagePage {
        testCase.expect(exists: messageThreadCell(), file: file, line: line)
        return self
    }


    
    
    // Verifications
    
    
    
    
}
