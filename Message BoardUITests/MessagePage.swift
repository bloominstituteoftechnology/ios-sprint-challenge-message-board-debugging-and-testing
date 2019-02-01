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
    
    
    // MARK: - Actions (interactions)
    
    
    
    @discardableResult func tapOnAddButton(at index: Int, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: addButton, file: file, line: line)
        addButton.tap()
        
        let messageDetailPage = MessageDetailPage(testCase: testCase)
        
        return messageDetailPage
        
    }

    
    
    // MARK: - Verifications
    
    
    @discardableResult func verifyThreadsHaveLoaded(file: String = #file, line: UInt = #line) -> MessagePage {

        let predicate = NSPredicate(format: "count > 0")

        testCase.expectation(for: predicate, evaluatedWith: app.tables.cells)
        testCase.waitForExpectations(timeout: 4, handler: nil)

        return self

    }
    
    @discardableResult func verifyMessagesHaveLoaded(file: String = #file, line: UInt = #line) -> MessagePage {
        
        let predicate = NSPredicate(format: "count > 0")
        
        testCase.expectation(for: predicate, evaluatedWith: app.tables.cells)
        testCase.waitForExpectations(timeout: 4, handler: nil)
        
        return self
        
    }
    
//    @discardableResult func verifyPopViewControllerAfterSend(file: String = #file, line: UInt = #line) -> MessagePage {
//        
//        
//        testCase.expect(exists: sendButton, file: file, line: line)
//        
//        return self
//        
//    }
    
    
}

