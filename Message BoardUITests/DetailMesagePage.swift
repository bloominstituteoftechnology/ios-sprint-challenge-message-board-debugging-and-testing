//
//  DetailMesagePage.swift
//  Message BoardUITests
//
//  Created by Iyin Raphael on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

import XCTest

struct DetailMessagePage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    var sendButton: XCUIElement {
        return app.navigationBars.element(boundBy: 0).buttons["Send"]
    }
    
    var textField: XCUIElement {
        return app.textFields["MessageDetailViewController.TextField"]
    }
    
    var textView: XCUIElement {
        return app.textViews["MessageDetailViewController.TextView"]
    }
    
    // MARK: - Actions
    
    @discardableResult func tapOnSendButton(file: String = #file, line: UInt = #line) -> DetailMessagePage {
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        return self
    }
    
    @discardableResult func typeSenderInTextField(text: String, file: String = #file, line: UInt = #line) -> DetailMessagePage {
        testCase.expect(exists: textField, file: file, line: line)
        textField.tap()
        textField.typeText(text)
        return self
    }
    
    @discardableResult func typeMessageInTextView(text: String, file: String = #file, line: UInt = #line) -> DetailMessagePage {
        testCase.expect(exists: textView, file: file, line: line)
        textView.tap()
        textView.typeText(text)
        return self
    }
    
    // MARK: - Verifications
    
    
    
}
