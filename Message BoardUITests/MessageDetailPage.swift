//
//  MessageDetailPage.swift
//  Message BoardUITests
//
//  Created by Moin Uddin on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

import XCTest

struct MessageDetailPage: TestPage {
    var testCase: XCTestCase
    
    //Computed Properties
    var nameTextField: XCUIElement {
        return app.textFields["MessageDetailViewController.NameTextField"]
    }
    
    var messageTextField: XCUIElement {
        return app.textViews["MessageDetailViewController.MessageTextField"]
    }
    
    var sendBarButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    //Actions
    
    @discardableResult func fillMessage(name: String, message: String) -> MessagesPage {
        testCase.expect(exists: nameTextField, file: #file, line: #line)
        testCase.expect(exists: messageTextField, file: #file, line: #line)
        testCase.expect(exists: sendBarButton, file: #file, line: #line)
        
        nameTextField.tap()
        nameTextField.typeText(name)
        messageTextField.tap()
        messageTextField.typeText(message)
        sendBarButton.tap()
        
        return MessagesPage(testCase: testCase)
    }
    
    //Verifications
}
