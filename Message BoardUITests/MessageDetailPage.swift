//
//  MessageDetailPage.swift
//  Message BoardUITests
//
//  Created by Samantha Gatt on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailPage: TestPage {
    
    let testCase: XCTestCase
    
    
    // MARK: - Elements
    
    var addBarButton: XCUIElement {
        return app.navigationBars.element(boundBy: 0).buttons["Add"]
    }
    
    var senderNameTextField: XCUIElement {
        return app.staticTexts["MessageDetailViewController.senderNameTextField"]
    }
    
    var messageTextView: XCUIElement {
        return app.staticTexts["MessageDetailViewController.messageTextView"]
    }
    
    
    // MARK: - Actions
    
    
    
    
    // MARK: - Verifications
    
    
}
