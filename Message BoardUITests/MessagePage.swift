//
//  MessagePage.swift
//  Message BoardUITests
//
//  Created by Benjamin Hakes on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


import XCTest

struct MessagePage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    private func messageCellFor(_ index: Int) -> XCUIElement {
        return app.tables.cells["MessageThreadDetailTableViewController.MessageCell\(index)"]
        
    }
    
    var addButton: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    
    var messageTableView: XCUIElement {
        
        return app.tables.containing(.cell, identifier:"MessageThreadDetailTableViewController.MessageCell0").element
    }
    
    // MARK: - Actions (interactions)
    
    @discardableResult func tapOnAddButton(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: addButton, file: file, line: line)
        addButton.tap()
        
        let messageDetailPage = MessageDetailPage(testCase: testCase)
        
        return messageDetailPage
        
    }
    
    @discardableResult func goBackToThreadCell(with string: String, file: String = #file, line: UInt = #line) -> ThreadPage {
        
        let threadPage = ThreadPage(testCase: testCase)
        
        testCase.expect(exists: app.navigationBars[string].buttons["λ Message Board"])
        app.navigationBars[string].buttons["λ Message Board"].tap()
        
        return threadPage
        
    }
    
    // MARK: - Verifications
    
    @discardableResult func verifyMessagesHaveLoaded(file: String = #file, line: UInt = #line) -> MessagePage {
        
        let predicate = NSPredicate(format: "count > 0")
        
        testCase.expectation(for: predicate, evaluatedWith: messageTableView.cells)
        testCase.waitForExpectations(timeout: 2, handler: nil)
        
        return self
        
    }
    
    @discardableResult func verifyMessagesCount(count int: Int, file: String = #file, line: UInt = #line) -> MessagePage {
        
        let predicate = NSPredicate(format: "count == \(int)")
    
        testCase.expectation(for: predicate, evaluatedWith: messageTableView.cells)
        testCase.waitForExpectations(timeout: 2, handler: nil)
        
        return self
        
    }
    
    @discardableResult func verifyMessagesWithSenderTitleExists(with string: String, file: String = #file, line: UInt = #line) -> MessagePage {
        
        testCase.expect(exists: app.cells.staticTexts[string])
        
        return self
        
    }
    
    

    
}

