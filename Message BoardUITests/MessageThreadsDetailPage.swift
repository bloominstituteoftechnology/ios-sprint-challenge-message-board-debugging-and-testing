//
//  MessageThreadsDetailPage.swift
//  Message BoardUITests
//
//  Created by Austin Cole on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

@testable import Message_Board
import XCTest

struct MessageThreadsDetailPage: TestPage {
    
    let testCase: XCTestCase
    
    // Elements
    
    func getCertainCell(index: Int) -> XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: 0)
    }
    var addButton: XCUIElement {
    return app.navigationBars.buttons["Add"]
    }
    var backButton: XCUIElement {
        return app.navigationBars.buttons["λ Message Board"]
    }

    // Interactions

    @discardableResult func tapOnAddButton(file: String = #file, line: UInt = #line) -> MessageThreadsDetailPage {
        testCase.expect(exists: addButton)
        addButton.tap()
        return self
    }
    @discardableResult func tapOnBackButton(file: String = #file, line: UInt = #line) -> MessageThreadsDetailPage {
        testCase.expect(exists: backButton)
        backButton.tap()
        return self
    }
    
    // Verifications
    
    @discardableResult func verifyMessageCellExists(file: String = #file, line: UInt = #line) -> MessageThreadsDetailPage {
        testCase.expect(exists: getCertainCell(index: 0), file: file, line: line)
        return self
    }
    @discardableResult func verifyMessageThreadTitleExists(messageThread: MessageThread, file: String = #file, line: UInt = #line) -> MessageThreadsDetailPage {
        testCase.expect(exists: app.navigationBars[messageThread.title], file: file, line: line)
        return self
    }
}
