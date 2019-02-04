//
//  MessageDetailPage.swift
//  Message BoardUITests
//
//  Created by Austin Cole on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailPage: TestPage {
    
    let testCase: XCTestCase
    
    // Elements
    
    var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    var senderNameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.SenderNameTextField"]
    }
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    // Interactions
    
    @discardableResult func tapOnSendButton(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        return self
    }
    @discardableResult func typeTextIntoTextField(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: senderNameTextField, file: file, line: line)
        senderNameTextField.tap()
        senderNameTextField.typeText("Austin")
        return self
    }
    @discardableResult func typeTextIntoTextView(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: messageTextView, file: file, line: line)
        messageTextView.tap()
        messageTextView.typeText("This is my awesome message to all of Lambda: Hello.")
        return self
    }
    
    // Verifications
    
    @discardableResult func verifySenderNameTextFieldExists(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: senderNameTextField, file: file, line: line)
        return self
    }
    @discardableResult func verifyMessageTextViewExists(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        testCase.expect(exists: messageTextView, file: file, line: line)
        return self
    }
    
}

