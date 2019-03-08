//
//  MessageDetailsViewPage.swift
//  Message BoardUITests
//
//  Created by Jason Modisett on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailsViewPage: TestPage {
    
    var testCase: XCTestCase
    var messageThreadDetailsTableViewPage: MessageThreadDetailTableViewPage
    
    
    // MARK:- UI elements
    
    var navBarBackButton: XCUIElement { return app.navigationBars.buttons.firstMatch }
    var sendOrUpdateButton: XCUIElement { return app.navigationBars.buttons.element(boundBy: 1) }
    var senderTextField: XCUIElement { return app.textFields.element(boundBy: 0) }
    var messageTextView: XCUIElement { return app.textViews.element(boundBy: 0) }
    
    
    // MARK:- Interactions
    
    @discardableResult func tapBackButton() -> MessageThreadDetailTableViewPage {
        
        navBarBackButton.tap()
        
        return messageThreadDetailsTableViewPage
    }
    
    @discardableResult func writeNewMessageWith(text: String, from sender: String) -> MessageDetailsViewPage {
        
        senderTextField.tap()
        senderTextField.typeText(sender)
        messageTextView.tap()
        messageTextView.typeText(text)
        
        return self
    }
    
    @discardableResult func sendOrUpdateMessage() -> MessageThreadDetailTableViewPage {
        
        sendOrUpdateButton.tap()
        
        return messageThreadDetailsTableViewPage
    }
    
    
    // MARK:- Verifications
    
    @discardableResult func verifyMessageDataWith(text: String, sender: String) -> MessageThreadDetailTableViewPage {
        
        testCase.expect(senderTextField.label, equals: sender, file: #file, line: #line)
        testCase.expect(messageTextView.label, equals: text, file: #file, line: #line)
        testCase.expect(messageThreadDetailsTableViewPage.cell(0).title, equals: text, file: #file, line: #line)
        
        return messageThreadDetailsTableViewPage
    }
    
}
