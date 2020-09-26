//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    private var textView: XCUIElement {
        return app.textViews["MessageDetailViewController.TextView"]
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testSegueToDetailTableVC() {
        tappedANewThread()
    }
    func testCreateANewThread() {
        createANewThread()
    }
    
    func testSegueToDetailVC() {
        tappedANewThread()
        tappedAddButton()
    }
    
    func testSendingMessage() {
        tappedANewThread()
        tappedAddButton()
        tapMessageTextView()
        sendButtonTapped()
    }
    
    //MARK: - Functions -
    func createANewThread() {
        XCUIApplication().tables.textFields["Create a new thread:"].tap()
    }
    
    func tappedANewThread() {
        app.tables.staticTexts["A New Thread"].tap()
    }
    
    func tappedAddButton() {
        app.navigationBars["Title"].buttons["Add"].tap()
    }
    
    func tapMessageTextView() {
        textView.tap()
    }
    func sendButtonTapped() {
        let newMessageNavigationBar = app.navigationBars["New Message"]
        let sendButton = newMessageNavigationBar.buttons["Send"]
        sendButton.tap()
    }
}

