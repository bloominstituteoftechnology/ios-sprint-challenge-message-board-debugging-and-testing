//
//  MessageTestsPage.swift
//  Message BoardUITests
//
//  Created by Madison Waters on 2/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct MThreadsDetailPage: TestPage {
    
    let testCase: XCTestCase
    
    func getCell(index: Int) -> XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: 0)
    }
    var addButton: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    var backButton: XCUIElement {
        return app.navigationBars.buttons["λ Message Board"]
    }
    
    
    @discardableResult func tapOnAddButton(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: addButton)
        addButton.tap()
        
        let messageDetailPage = MessageDetailPage(testCase: testCase)
        return messageDetailPage
    }
    @discardableResult func tapOnBackButton(file: String = #file, line: UInt = #line) -> MThreadsDetailPage {
        
        testCase.expect(exists: backButton)
        backButton.tap()
        return self
    }
    
    
    @discardableResult func messageCellExists(file: String = #file, line: UInt = #line) -> MThreadsDetailPage {
        
        testCase.expect(exists: getCell(index: 0), file: file, line: line)
        return self
    }
    
    @discardableResult func messageThreadTitleExists(with string: String, file: String = #file, line: UInt = #line) -> MThreadsDetailPage {
        
        testCase.expect(exists: app.cells.staticTexts[string])
        return self
        
    }
}
