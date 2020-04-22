//
//  NewMessagePage.swift
//  Message BoardUITests
//
//  Created by Farhan on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct NewMessagePage: TestPage {
    
    var testCase: XCTestCase
    
    // MARK:- Elements
    
    private var senderField: XCUIElement {
        return app.textFields["NewMessageView.SenderField"]
    }
    
    private var contentField: XCUIElement {
        return app.textViews["NewMessageView.ContentField"]
    }
    
    private var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    // MARK:- Interactions
    
    func createMessage(with sender: String, content: String) -> NewMessagePage {
        senderField.typeText(sender)
        contentField.typeText(content)
        return self
    }
    
    func sendMessage() -> MessagePage {
        sendButton.tap()
        return MessagePage(testCase: testCase)
    }
    
    // MARK:- Verifications
    
    @discardableResult func verifyMessagesCreated() -> MessagePage {
        
        let cells = app.tables.cells.allElementsBoundByIndex
        
        for cell in cells {
            
            if cell.isHittable {
                assert(cell.textFields.allElementsBoundByIndex.count == 1)
            }
        }
        return MessagePage(testCase:testCase)
    }
        
    
    
    
    
}
