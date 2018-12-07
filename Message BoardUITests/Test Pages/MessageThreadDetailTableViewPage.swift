//
//  MessageThreadDetailTableViewPage.swift
//  Message BoardUITests
//
//  Created by Jason Modisett on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

struct MessageThreadDetailTableViewPage: TestPage {
    
    var testCase: XCTestCase
    var messageThreadsTableViewPage: MessageThreadsTableViewPage
    
    
    // MARK:- UI elements

    var navBarBackButton: XCUIElement { return app.navigationBars.buttons.firstMatch }
    var addMessageButton: XCUIElement { return app.navigationBars.buttons["Add"] }
    
    private func navBarTitle(for thread: MessageThread) -> XCUIElement { return app.navigationBars[thread.title] }

    func cell(_ index: Int) -> XCUIElement { return app.tables.cells.containing(.cell, identifier: "\(index)").element }
    
    
    // MARK:- Interactions
    
    @discardableResult func tapBackButton() -> MessageThreadsTableViewPage {
        
        navBarBackButton.tap()
        
        return messageThreadsTableViewPage
    }
    
    @discardableResult func tapAddMessageButton() -> MessageDetailsViewPage {
        
        addMessageButton.tap()
        
        return MessageDetailsViewPage(testCase: testCase, messageThreadDetailsTableViewPage: self)
    }
    
    
    // MARK:- Verifications
    
    @discardableResult func verifyMessageData(at index: Int) -> MessageThreadDetailTableViewPage {
        
        testCase.expect(true: cell(0).isHittable, file: #file, line: #line)
        
        return self
    }
    
}
