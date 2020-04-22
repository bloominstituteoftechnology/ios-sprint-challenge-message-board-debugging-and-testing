//
//  MessagesPage.swift
//  Message BoardUITests
//
//  Created by Moin Uddin on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct MessagesPage: TestPage {
    var testCase: XCTestCase
    
    //Computed Properties
    var messsage: XCUIElement {
        return app.tables.cells["MessageThreadDetailTableViewController.Message"]
    }
    
    var addBarButton: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    
    //Actions
    @discardableResult func tapMessage() -> MessageDetailPage {
        testCase.expect(exists: messsage, file: #file, line: #line)
        messsage.tap()
        return MessageDetailPage(testCase: testCase)
    }
    
    @discardableResult func tapAddBarButton() -> MessageDetailPage {
        testCase.expect(exists: addBarButton, file: #file, line: #line)
        addBarButton.tap()
        return MessageDetailPage(testCase: testCase)
    }
    
    //Verifications
    @discardableResult func verifyMessage(message: String) -> MessagesPage {
        testCase.expect(exists: app.cells.staticTexts[message], file: #file, line: #line)
        return self
    }
}
