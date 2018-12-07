//
//  MessageDetailTestPage.swift
//  Message BoardUITests
//
//  Created by Sean Hendrix on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailTestPage: TestPage {
    var testCase: XCTestCase
    let parent: MessageThreadDetailTestPage
    
    // MARK: - UI Elements
    private var backButton: XCUIElement {
        return app.navigationBars.buttons[parent.title]
    }
    
    private var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    private var nameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.NameTextField"]
    }
    
    private var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    // MARK: - Actions
    @discardableResult func tapBackButton(file: String = #file, line: UInt = #line) -> MessageThreadDetailTestPage {
        testCase.expect(exists: backButton, file: file, line: line)
        backButton.tap()
        return parent
    }
    
    @discardableResult func tapSendButton(file: String = #file, line: UInt = #line) -> MessageThreadDetailTestPage {
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        return parent
    }
    
    @discardableResult func writeName(_ name: String, file: String = #file, line: UInt = #line) -> MessageDetailTestPage {
        testCase.expect(exists: nameTextField, file: file, line: line)
        nameTextField.tap()
        nameTextField.typeText(name)
        nameTextField.typeText("\n")
        return self
    }
    
    @discardableResult func writeMessage(_ message: String, file: String = #file, line: UInt = #line) -> MessageDetailTestPage {
        testCase.expect(exists: messageTextView)
        testCase.expect(messageTextView.value as! String?, equals: "", file: file, line: line)
        messageTextView.tap()
        messageTextView.typeText(message)
        return self
    }
    
    // MARK: - Verifications
    @discardableResult func titleDisplays(_ title: String, file: String = #file, line: UInt = #line) -> MessageDetailTestPage {
        let navBar = app.navigationBars.firstMatch
        testCase.expect(navBar.identifier, equals: title, file: file, line: line)
        return self
    }
    
}
