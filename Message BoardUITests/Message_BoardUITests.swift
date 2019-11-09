//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateMessage() {
        
        MThreadsDetailPage(testCase: self)
            .tapOnAddButton()
        MessageDetailPage(testCase: self)
            .senderNameTextFieldExists()
            .textEntryTextField()
            .textEntryTextView()
            .tapOnSendButton()
    }
    
    func testMisc() {
        MThreadsDetailPage(testCase: self)
            .messageCellExists()
    }
    
    func testCell() {
        

        MThreadsDetailPage(testCase: self)
            .getCell(index: 0)
    }
    
    func testCreateThread() {
        
        MessageThreadsPage(testCase: self)
            .addTextTitleTextField(with: "Test")
    }
    
    func testNavigation() {
        
        MThreadsDetailPage(testCase: self)
            .tapOnAddButton()
        MessageDetailPage(testCase: self)
            .tapOnSendButton()
        MThreadsDetailPage(testCase: self)
            .tapOnBackButton
    }
    
}
