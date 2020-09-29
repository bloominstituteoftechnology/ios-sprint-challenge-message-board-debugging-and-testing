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
    
    let mockMessage1 = MockMessage(threadTitle: "A New Thread",
                                   sender: "Dude",
                                   message: "is it working?")

    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testAddMessageButtonTap() {
        let mockMessage3 = MockMessage(threadTitle: mockMessage1.threadTitle,
                                       sender: "Ben",
                                       message: "Dude... SWEET!")
        
        sleep(15)
        assertThreadCellExists(for: mockMessage3.threadTitle)
        tapThreadCell(withTitle: mockMessage3.threadTitle)
        
        tapAddMessageButton()
        
        enterSenderName(mockMessage3.sender)
        tapSendButton()
        tapBackButton()
        assertMessageCellExists(forMessage: mockMessage3.message, from: mockMessage3.sender)
    }
    
}

extension Message_BoardUITests {
    
    func enterSenderName(_ sender: String) {
        app.textFields["MessageThread.Message.Sender"].tap()
        app.textFields["MessageThread.Message.Sender"].typeText(sender)
    }
    
    func createNewThread(with title: String) {
        let createThreadTextField = app.tables.textFields["MessageThreadsTableViewController.CreateThreadTextField"]
        createThreadTextField.tap()
        createThreadTextField.typeText(title)
        
    }
    
    func assertThreadCellExists(for threadTitle: String) {
        XCTAssertTrue(app.tables.cells["MessageThreadsTableViewController.MessageThreadCell"].staticTexts[threadTitle].exists)
    }
    
    func assertMessageCellExists(forMessage messageText: String) {
        XCTAssertTrue(app.tables.cells["MessageThreadDetailTableViewController.MessageCell"].staticTexts[messageText].exists)
    }
    
    func assertMessageCellExists(forMessage messageText: String, from sender: String) {
        assertMessageCellExists(forMessage: messageText)
        XCTAssertTrue(app.tables.cells["MessageThreadDetailTableViewController.MessageCell"].staticTexts[sender].exists)
    }
    
    var tableView: XCUIElement {
        return app.tables.element(boundBy: 0)
    }
    
    func messageCell(atRow row: Int) -> XCUIElement {
        return tableView.cells.element(boundBy: row)
    }
    
    func tapSendButton() {
        app.navigationBars.buttons["Send"].tap()
    }
    
    func tapBackButton() {
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    var createThreadTextField: XCUIElement {
        app.tables.textFields["MessageThreadsTableViewController.CreateThreadTextField"]
    }
    
    var messageSenderTextField: XCUIElement {
        app.tables.textFields["MessageThreadsTableViewController.CreateThreadTextField"]
    }
    
    func tapAddMessageButton() {
        app.buttons["Add"].tap()
    }
    
    func tapMessageCell(with messageText: String) {
        assertMessageCellExists(forMessage: messageText)
        app.tables.cells["MessageThreadDetailTableViewController.MessageCell"].staticTexts[messageText].tap()
    }
    
    func tapThreadCell(withTitle threadTitle: String) {
        app.tables.cells.matching(identifier: "MessageThreadsTableViewController.MessageThreadCell").staticTexts[threadTitle].tap()
    }
    
    struct MockMessage {
        let threadTitle: String
        let sender: String
        let message: String
    }
}

