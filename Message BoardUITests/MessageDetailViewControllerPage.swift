//
//  MessageDetailViewControllerPage.swift
//  Message BoardUITests
//
//  Created by Daniela Parra on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailViewControllerPage: TestPage {
    
    // MARK: - Interactions
    
    // Go back to thread detail page
    @discardableResult func goBackToThread(of name: String) -> ThreadDetailTableViewControllerPage {
        let button = backButton(to: name)
        button.tap()
        return threadDetailTableViewControllerPage
    }
    
    // Send message
    @discardableResult func sendMessage(from sender: String, with text: String) -> ThreadDetailTableViewControllerPage {
        senderTextField.tap()
        senderTextField.typeText(sender)
        messageTextView.tap()
        messageTextView.typeText(text)
        sendButton.tap()
        return threadDetailTableViewControllerPage
    }
    
    
    
    
    // MARK: - Verifications
    
    // Goes back to the right thread
    @discardableResult func verifyBackButtonLabel(with name: String) -> ThreadDetailTableViewControllerPage {
        let button = backButton(to: name)
        testCase.expect(exists: button, file: #file, line: #line)
        return threadDetailTableViewControllerPage
    }
    
    // Message was sent
    @discardableResult func verifyMessageSent(for sender: String, with message: String) -> ThreadDetailTableViewControllerPage {
        testCase.expect(senderTextField.label, equals: sender, file: #file, line: #line)
        testCase.expect(messageTextView.label, equals: message, file: #file, line: #line)
        
        return threadDetailTableViewControllerPage
    }
    
    // MARK: - Elements
    
    // Back button
    func backButton(to thread: String) -> XCUIElement {
        return app.navigationBars.buttons["\(thread)"]
    }
    
    // Send button
    var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    // Sender text field
    var senderTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.SenderTextField"]
    }
    
    // Message text view
    var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextView"]
    }
    
    var testCase: XCTestCase
    var threadDetailTableViewControllerPage: ThreadDetailTableViewControllerPage
    
}
