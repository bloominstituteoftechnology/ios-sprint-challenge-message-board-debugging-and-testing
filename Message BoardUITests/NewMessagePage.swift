//
//  NewMessagePage.swift
//  Message BoardUITests
//
//  Created by Nikita Thomas on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct NewMessagePage: TestPage {
    var testCase: XCTestCase
    
    // UI ELements
    var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    var nameInput: XCUIElement {
        return app.textFields["newMessageView.nameInput"]
    }
    
    var messageInput: XCUIElement {
        return app.textViews["newMessageView.messageInput"]
    }
    
    
    // Actions
    
    @discardableResult func sendNewMessage() -> DetailVCPage {
        nameInput.tap()
        nameInput.typeText("TestName\n")
        messageInput.tap()
        messageInput.typeText("TestMessage")
        sendButton.tap()
        return DetailVCPage(testCase: testCase)
    }
    
    
    // Verficiations
    
    
    
}
