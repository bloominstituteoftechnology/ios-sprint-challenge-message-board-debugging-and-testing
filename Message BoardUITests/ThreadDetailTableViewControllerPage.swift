//
//  ThreadDetailTableViewControllerPage.swift
//  Message BoardUITests
//
//  Created by Daniela Parra on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct ThreadDetailTableViewControllerPage: TestPage {
    
    // MARK: - Interactions
    
    // Go back to threads TVC
    @discardableResult func goBackToThreads() -> ThreadsTableViewControllerPage {
        backButtonToThreads.tap()
        return threadsTableViewControllerPage
    }
    
    // Click add button
    @discardableResult func clickAddButton() -> MessageDetailViewControllerPage {
        addMessageButton.tap()
        return MessageDetailViewControllerPage(testCase: self.testCase, threadDetailTableViewControllerPage: self)
    }
    
    // MARK: - Verifications
    
    // See messages
    @discardableResult func seeMessageAtFirstCell() -> ThreadDetailTableViewControllerPage {
        testCase.expect(exists: firstCell, file: #file, line: #line)
        return self
    }
    
    // Arrived to correct thread
    @discardableResult func atCorrectThread(of name: String) -> ThreadDetailTableViewControllerPage {
        let navigationTitle = titleFor(threadName: name)
        testCase.expect(exists: navigationTitle, file: #file, line: #line)
        return self
    }
    
    // MARK: - Elements
    
    // Title
    func titleFor(threadName: String) -> XCUIElement {
        return app.navigationBars["\(threadName)"]
    }
    
    // First cell
    var firstCell: XCUIElement {
        return app.tables.cells["MessageThreadDetailTableViewController.MessageCell"].firstMatch
    }
    
    // Back button
    var backButtonToThreads: XCUIElement {
        return app.navigationBars.buttons["λ Message Board"]
    }
    
    // Add button
    var addMessageButton: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    
    var testCase: XCTestCase
    var threadsTableViewControllerPage: ThreadsTableViewControllerPage
    
}
