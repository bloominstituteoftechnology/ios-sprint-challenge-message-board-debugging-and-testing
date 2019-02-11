//
//  MessageDetailTests.swift
//  Message BoardUITests
//
//  Created by Madison Waters on 2/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct MessageDetailPage: TestPage {
    
    let testCase: XCTestCase

    var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    var senderNameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.SenderNameTextField"]
    }
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.messageTextView"]
    }
    
    
    @discardableResult func tapOnSendButton(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        return self
    }
    
    @discardableResult func textEntryTextField(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: senderNameTextField, file: file, line: line)
        senderNameTextField.tap()
        senderNameTextField.typeText("Retest Yo Self")
        return self
    }
    
    @discardableResult func textEntryTextView(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: messageTextView, file: file, line: line)
        messageTextView.tap()
        messageTextView.typeText("This is not a test.")
        return self
    }
    
    
    @discardableResult func senderNameTextFieldExists(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: senderNameTextField, file: file, line: line)
        return self
    }
    
    @discardableResult func messageTextViewExists(file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: messageTextView, file: file, line: line)
        return self
    }
    
}
