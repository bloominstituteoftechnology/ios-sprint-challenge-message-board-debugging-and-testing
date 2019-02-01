//
//  MessageDetailPage.swift
//  Message BoardUITests
//
//  Created by Benjamin Hakes on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

import Foundation


import XCTest

struct MessageDetailPage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    
    
    // MARK: - Actions (interactions)
    
    @discardableResult func tapSendButton(with string: String, file: String = #file, line: UInt = #line) -> MessagePage {
        
        testCase.expect(exists: sendButton, file: file, line: line)
        sendButton.tap()
        
        let messagePage = MessagePage(testCase: testCase)
        
        return messagePage
        
    }
    
    
    
    // MARK: - Verifications
    
    
}
