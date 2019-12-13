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
    
    func testThreadTableShowsThreads() {
        let messageBoardHeader = "λ Message Board"
        let thread1Name = "Testing again"
        let thread2Name = "A New Thread"
        
        let threadsTableVCNavBar = app.navigationBars[messageBoardHeader]
        let threadTable = app.tables
        let thread1Cell = threadTable.staticTexts[thread1Name]
        let thread2Cell = threadTable.staticTexts[thread2Name]
        
        XCTAssertTrue(threadsTableVCNavBar.exists)
        XCTAssertTrue(thread1Cell.exists)
        XCTAssertTrue(thread2Cell.exists)
        
        thread1Cell.tap()
        
        let thread1NavBar = app.navigationBars[thread1Name]
        let thread1MessageCell = app.tables.cells["MessageDetailCell"]
        let thread1MessageLabel = thread1MessageCell.staticTexts["MessageCellMessageTextLabel"]
        let thread1MessageSender = thread1MessageCell.staticTexts["MessageCellSenderLabel"]
        
        XCTAssertTrue(thread1NavBar.exists)
        XCTAssertTrue(thread1MessageCell.exists)
        XCTAssertTrue(thread1MessageLabel.exists)
        XCTAssertTrue(thread1MessageSender.exists)
        XCTAssertEqual(thread1MessageLabel.label, "It’s working!")
        XCTAssertEqual(thread1MessageSender.label, "Bob")
        
        thread1NavBar.buttons[messageBoardHeader].tap()
        
        XCTAssertTrue(threadsTableVCNavBar.exists)
        XCTAssertTrue(thread1Cell.exists)
        XCTAssertTrue(thread2Cell.exists)
        
        thread2Cell.tap()
        
        let thread2NavBar = app.navigationBars[thread2Name]
        let thread2MessageCell = app.tables.cells["MessageDetailCell"]
        let thread2MessageLabel = thread2MessageCell.staticTexts["MessageCellMessageTextLabel"]
        let thread2MessageSender = thread2MessageCell.staticTexts["MessageCellSenderLabel"]
        
        XCTAssertTrue(thread2NavBar.exists)
        XCTAssertTrue(thread2MessageCell.exists)
        XCTAssertTrue(thread2MessageLabel.exists)
        XCTAssertTrue(thread2MessageSender.exists)
        XCTAssertEqual(thread2MessageLabel.label, "Checking to make sure this works.")
        XCTAssertEqual(thread2MessageSender.label, "Joe")
        
        thread2NavBar.buttons[messageBoardHeader].tap()
        
        XCTAssertTrue(threadsTableVCNavBar.exists)
        XCTAssertTrue(thread1Cell.exists)
        XCTAssertTrue(thread2Cell.exists)
    }
    
    func testCreateMessage() {
        let newThreadTextField = app.tables["Empty list"]
            .textFields["Create a new thread:"]
        let newThreadTitle = "New thread title"
        newThreadTextField.tap()
        newThreadTextField.typeText(newThreadTitle)
        app.keyboards.buttons["Return"].tap()
        
        app.tables.staticTexts[newThreadTitle].tap()
        app.navigationBars[newThreadTitle].buttons["Add"].tap()
        
        let nameTextField = app.textFields["messageDetail.nameTextField"]
        let senderName = "jonbash"
        nameTextField.tap()
        nameTextField.typeText(senderName)
        
        let messageTextView = app.descendants(matching: .textView).element
        let messageText = "this is a new message"
        messageTextView.tap()
        messageTextView.typeText(messageText)
        
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        XCTAssertTrue(app.navigationBars[newThreadTitle].exists)
        XCTAssertTrue(app.tables.cells.staticTexts[messageText].exists)
        XCTAssertTrue(app.tables.cells.staticTexts[senderName].exists)
    }
    
}
