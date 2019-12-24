//
//  ThreadMessagesPage.swift
//  Message BoardUITests
//
//  Created by Jerrick Warren on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct ThreadMessagesPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    var nameInput: XCUIElement {
        return app.textFields["MessageView.nameInput"]
    }
    
    var messageInput: XCUIElement {
        return app.textViews["MessageView.messageInput"]
    }
    
    // Actions
    
    @discardableResult func sendNewMessage() -> ThreadTVCPage {
        nameInput.tap()
        nameInput.typeText("NewTestName\n")
        messageInput.tap()
        messageInput.typeText("NewTestMessage")
        sendButton.tap()
        
        return ThreadTVCPage(testCase: testCase)
    }

    
   
}
