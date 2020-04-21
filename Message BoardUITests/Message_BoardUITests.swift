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
    
    let mockMessage1 = MockMessage(threadTitle: "A New Thread",
                                   sender: "Joe",
                                   message: "Checking to make sure this works.")
    
    let mockMessage2 = MockMessage(threadTitle: "Testing again",
                                   sender: "Bob",
                                   message: "It’s working!")
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testAddMessageButtonTap() {
        let mockMessage3 = MockMessage(threadTitle: mockMessage1.threadTitle,
                                       sender: "David",
                                       message: "I'm so stoked about this UI testing!")
        
        // MessageThreadsTableViewController
        assertThreadCellExists(for: mockMessage3.threadTitle)
        tapThreadCell(withTitle: mockMessage3.threadTitle)
        
        // MessageThreadDetailTableViewController
        tapAddMessageButton()
        
        // MessageDetailViewController
        enterSenderName(mockMessage3.sender)
        enterMessageText(mockMessage3.message)
        tapSendButton()
        tapBackButton()
        
        // MessageThreadDetailTableViewController
        assertMessageCellExists(forMessage: mockMessage3.message, from: mockMessage3.sender)
    }
    
    /*
    func testSendMessageButtonTap() {
        
    }
    */
    
    func enterSenderName(_ sender: String) {
        app.textFields["MessageThread.Message.sender"].tap()
        app.textFields["MessageThread.Message.sender"].typeText(sender)
    }
    
    func enterMessageText(_ text: String) {
        app.textViews["MessageThread.Message.messageText"].tap()
        app.textViews["MessageThread.Message.messageText"].typeText(text)
    }
    
    func createNewThread(with title: String) {
        let createThreadTextField = app.tables.textFields["MessageThreadsTableViewController.createThreadTextField"]
        createThreadTextField.tap()
        createThreadTextField.typeText("Test Thread")
        
        
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
        //app.navigationBars.buttons["Back"].tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    var createThreadTextField: XCUIElement {
        app.tables.textFields["MessageThreadsTableViewController.createThreadTextField"]
    }
    
    var messageSenderTextField: XCUIElement {
        app.tables.textFields["MessageThreadsTableViewController.createThreadTextField"]
    }
    
    func tapAddMessageButton() {
        app.buttons["Add"].tap()
    }
    
    func tapMessageCell(with messageText: String) {
        assertMessageCellExists(forMessage: messageText)
        app.tables.cells["MessageThreadDetailTableViewController.MessageCell"].staticTexts[messageText].tap()
    }
    
//    func tapMessageCell(for sender: String, withText text: String) {
//        app.tables.cells.matching(identifier: "MessageThreadsTableViewController.MessageThreadCell").staticTexts[threadName].tap()
//    }
    
//    func tapMessageCell(atRow row: Int) {
//        app.tables.cells.matching(identifier: "MessageThreadsTableViewController.MessageThreadCell").element(boundBy: row).tap()
//    }
    
    func tapThreadCell(withTitle threadTitle: String) {
        app.tables.cells.matching(identifier: "MessageThreadsTableViewController.MessageThreadCell").staticTexts[threadTitle].tap()
    }
    
    struct MockMessage {
        let threadTitle: String
        let sender: String
        let message: String
    }
}
