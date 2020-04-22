//
//  MessageDetailPage.swift
//  Message BoardUITests
//
//  Created by Benjamin Hakes on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

import Foundation


import XCTest

struct MessageDetailPage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    var senderTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.SenderTextField"]
    }
    
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    var okButton: XCUIElement {
        return app.buttons["OK"]
    }
    
    
    // MARK: - Actions (interactions)
    
    @discardableResult func enterTextIntoSenderTextField(sender string: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: senderTextField, file: file, line: line)
        senderTextField.tap()
        senderTextField.typeText(string)
        
        return self
        
    }
    
    @discardableResult func enterTextIntoMessageTextView(text string: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: messageTextView, file: file, line: line)
        messageTextView.tap()
        messageTextView.typeText(string)
        
        return self
        
    }
    
    @discardableResult func tapSendButtonSuccess(file: String = #file, line: UInt = #line) -> MessagePage {
        
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        
        let messagePage = MessagePage(testCase: testCase)
        return messagePage
    
    }
    
    @discardableResult func tapSendButtonFail(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        
        return self
        
    }
    
    @discardableResult func tapAlertOkay(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: okButton, file: file, line: line)
        okButton.tap()
        
        return self
        
    }
    
    // MARK: - Verifications
    
    
    @discardableResult func verifySendButtonNotification(with string: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        
        return self
        
    }
    
    @discardableResult func verifyAlertExists(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: okButton, file: file, line: line)
        
        return self
        
    }
    
}
