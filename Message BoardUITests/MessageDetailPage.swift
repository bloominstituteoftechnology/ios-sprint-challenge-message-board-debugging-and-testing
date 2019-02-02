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
    
    var messageTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.MessageTextField"]
    }
    
    
    // MARK: - Actions (interactions)
    
    @discardableResult func enterTextIntoSenderTextField(with string: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        
        testCase.expect(exists: senderTextField, file: file, line: line)
        senderTextField.typeText(string)
        
        return self
        
    }
    
    @discardableResult func tapSendButton(with string: String, file: String = #file, line: UInt = #line) -> MessagePage {
        
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        
        let messagePage = MessagePage(testCase: testCase)
        
        return messagePage
    
    }
    // MARK: - Verifications
    
    
//    @discardableResult func verifySendButtonNotification(with string: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
//        
//        testCase.expect(exists: sendButton, file: file, line: line)
//        sendButton.tap()
//        
//        return self
//        
//    }
    
}
