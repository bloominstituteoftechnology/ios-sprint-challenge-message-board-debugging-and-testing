//
//  MessageThreadsPage.swift
//  Message BoardUITests
//
//  Created by Moin Uddin on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct MessageThreadsPage: TestPage {
    var testCase: XCTestCase
    
    //Computed Properties
    
    var messsageThread: XCUIElement {
        return app.tables.cells["MessageThreadsTableViewController.MessageThread"]
    }
    
    var newMessageThreadTextField: XCUIElement {
        return app.textFields["MessageThreadsTableViewController.TextField"]
    }
    
    //Actions
    
    @discardableResult func tapMessageThread() -> MessagesPage {
        testCase.expect(exists: messsageThread, file: #file, line: #line)
        messsageThread.tap()
        return MessagesPage(testCase: testCase)
    }
    
    @discardableResult func createMessageThread(_ title: String) -> MessageThreadsPage {
        testCase.expect(exists: newMessageThreadTextField, file: #file, line: #line)
        newMessageThreadTextField.tap()
        newMessageThreadTextField.typeText(title)
        app.keyboards.buttons["return"].tap()
        return self
    }
    
    //Verifications
    
    @discardableResult func verifyMessageThread(title: String) -> MessageThreadsPage {
        testCase.expect(exists: app.cells.staticTexts[title], file: #file, line: #line)
        return self
    }
}
