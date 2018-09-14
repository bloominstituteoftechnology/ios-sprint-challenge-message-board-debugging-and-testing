//
//  MessageDetailPage.swift
//  Message BoardUITests
//
//  Created by Samantha Gatt on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailPage: TestPage {
    
    let testCase: XCTestCase
    
    
    // MARK: - Elements
    
    var sendBarButton: XCUIElement {
        return app.navigationBars.element(boundBy: 0).buttons["Send"]
    }
    
    var senderNameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.senderNameTextField"]
    }
    
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.messageTextView"]
    }
    
    
    // MARK: - Actions
    
    @discardableResult func enterSenderName(text: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: senderNameTextField, file: file, line: line)
        senderNameTextField.tap()
        senderNameTextField.typeText(text)
        return self
    }
    
    @discardableResult func enterMessageText(text: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: messageTextView, file: file, line: line)
        messageTextView.tap()
        messageTextView.typeText(text)
        return self
    }
    
    @discardableResult func tapOnSendBarButton(file: String = #file, line: UInt = #line) -> MessagesTablePage {
        testCase.expect(exists: sendBarButton, file: file, line: line)
        sendBarButton.tap()
        return MessagesTablePage(testCase: testCase)
    }
    
    
    // MARK: - Verifications
    
    @discardableResult func verifySenderNameWasEntered(name: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        let senderNameTextField = app.textFields[name]
        testCase.expect(exists: senderNameTextField, file: file, line: line)
        return self
    }
    
    @discardableResult func verifyMessageTextWasEntered(text: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        let messageTextView = app.textViews[text]
        testCase.expect(exists: messageTextView, file: file, line: line)
        return self
    }
}
