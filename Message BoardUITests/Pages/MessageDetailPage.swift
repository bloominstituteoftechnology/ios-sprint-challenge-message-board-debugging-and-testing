//
//  MessageDetailPage.swift
//  Message BoardUITests
//
//  Created by Jessie Ann Griffin on 4/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailPage: TestPage {
    let testCase: XCTestCase
    
    var backButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 0)
    }
    
    var sendButton: XCUIElement {
        return app.buttons["MessageDetailViewController.SendButton"]
    }
    
    var messageSenderTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.SenderName"]
    }
    
    @discardableResult func tapSendMessageButton(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        
        print(app)
        return self
    }
    
    @discardableResult func tapBackButton(file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewPage {
        testCase.expect(exists: backButton, file: file, line: line)
        backButton.tap()
        return MessageThreadDetailTableViewPage(testCase: testCase)
    }
    
    @discardableResult func verifyMessageDetailPageIsShowing(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: messageSenderTextField, file: file, line: line)
        return self
    }
}

