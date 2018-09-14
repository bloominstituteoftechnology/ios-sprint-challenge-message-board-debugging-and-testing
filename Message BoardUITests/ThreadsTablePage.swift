//
//  MessageBoardPage.swift
//  Message BoardUITests
//
//  Created by Andrew Dhan on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct ThreadsTablePage: TestPage {
    var testCase: XCTestCase
    
    //MARK Verify
    @discardableResult func verifyMessageAdded(inputText: String, file: String = #file, line: UInt = #line) -> ThreadsTablePage {
        testCase.expect(exists: tableCell, file: file, line: line)
        testCase.expect(inputText, equals: tableCell.title, file: file, line: line)
        return self
    }
    
    //MARK: Actions
    @discardableResult func addMessageThread(text: String, file: String = #file, line: UInt = #line) -> ThreadsTablePage {
        testCase.expect(exists: textInput, file: file, line: line)
        textInput.tap()
        textInput.typeText("Check this out")
        textInput.typeText("\n")
        return self
    }
    
    //MARK: Elements
    private var textInput: XCUIElement {
        return app.textFields["ThreadsTable.TextInput"]
    }
    private var tableCell: XCUIElement {
        let count = app.cells.count
        return app.cells.element(boundBy: count - 1)
    }
}
