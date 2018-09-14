//
//  DetailMessagePage.swift
//  Message BoardUITests
//
//  Created by Lisa Sampson on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct DetailMessagePage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    var sendButton: XCUIElement {
        return app.buttons[""]
    }
    
    var textField: XCUIElement {
        return app.textFields.staticTexts["MessageDetailViewController.TextField"]
    }
    
    var textView: XCUIElement {
        return app.textViews.staticTexts["MessageDetailViewController.TextView"]
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Verifications
    
    
    
}
