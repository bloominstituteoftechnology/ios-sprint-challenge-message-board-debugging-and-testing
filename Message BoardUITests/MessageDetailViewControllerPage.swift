//
//  MessageDetailViewControllerPage.swift
//  Message BoardUITests
//
//  Created by Linh Bouniol on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailViewControllerPage: TestPage {
    
    let testCase: XCTestCase
    
    // elements
    
    var sendButton: XCUIElement {
        return app.buttons["Send"]
    }
    
    var nameTextField: XCUIElement {
        return app.textFields["MessageDetailViewControllerPage.NameTextField"]
    }
    
    var noteTextView: XCUIElement {
        return app.textViews["MessageDetailViewControllerPage.NoteTextView"]
    }
    
    // actions
    
    @discardableResult func tapSendButton(file: String = #file, line: UInt = #line) -> MessageThreadDetailTableViewControllerPage {
        
        testCase.expect(exists: nameTextField)
        nameTextField.tap()
        nameTextField.typeText("food")
        
        testCase.expect(exists: noteTextView)
        noteTextView.tap()
        noteTextView.typeText("chicken")
        
        testCase.expect(exists: sendButton)
        sendButton.tap()
        
        return MessageThreadDetailTableViewControllerPage(testCase: testCase) // takes you back to previuos screen
    }
    
}
