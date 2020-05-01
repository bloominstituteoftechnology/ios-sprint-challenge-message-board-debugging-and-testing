//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct FakeMessage {
    let threadTitle: String
    let sender: String
    let message: String
}

  let fakeMessage1 = FakeMessage(threadTitle: "Thread1", sender: "Sal", message: "checking thread existence")
  let fakeMessage2 = FakeMessage(threadTitle: "Thread2", sender: "Sal2", message: "second thread check")

/*
 Fields inside App
 MessageThreadsTableVC.createNewThread
 MessageThreadsTableVC.threadCell
 MessageThreadsTableVC.threadNameCell
 
 MessageThreadDetailTableVC.cell
 MessageThreadDetailTableVC.SenderName
 MessageThreadDetailTableVC.SenderMessage
 
 MessageDetailVC.SenderName
 */

/* sample run
 //    func testIdentifiers()  {
 ////              let app = XCUIApplication()
 //      app.launch()
 //
 //
 //        let app = XCUIApplication()
 //        app.tables["Empty list"]/*@START_MENU_TOKEN@*/.textFields["createNewThread"]/*[[".textFields[\"Create a new thread:\"]",".textFields[\"createNewThread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
 //        app.tables/*@START_MENU_TOKEN@*/.staticTexts["threadName"]/*[[".cells",".staticTexts[\"enter name of new thread\"]",".staticTexts[\"threadName\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
 //        app.navigationBars["enter name of new thread"].buttons["Add"].tap()
 //
 //        let enternameTextField = app/*@START_MENU_TOKEN@*/.textFields["enterName"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"enterName\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
 //        enternameTextField.tap()
 //
 //        let entermessageTextView = app.textViews["enterMessage"]
 //        entermessageTextView.tap()
 //        app.navigationBars["New Message"].buttons["Send"].tap()
 //
 //
 //    }
 */

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
    
    func enterSenderName(_ sender: String) {
        app.textFields["MessageThreadDetailTableVC.SenderName"].tap()
        app.textFields["MessageThreadDetailTableVC.SenderName"].typeText(sender)
    }
    
    func enterMessageText(_ text: String) {
        app.textFields["MessageThreadDetailTableVC.SenderMessage"].tap()
        //check simulator connect hardware keyords off
        app.textViews["MessageThreadDetailTableVC.SenderMessage"].typeText(text)
    }
    
    func createNewThread(with title: String) {
        let createNewThreadField = app.tables.textFields["MessageThreadsTableVC.createNewThread"]
        createNewThreadField.tap()
        createNewThreadField.typeText(title)
        
    }
    
    func assertThreadCellExists(for threadTitle: String) {
        XCTAssertTrue(app.tables.cells["MessageThreadsTableVC.threadCell"].staticTexts[threadTitle].exists)
    }
    
    func assertMessageCellExists(forMessage messageText: String) {
        XCTAssertTrue(app.tables.cells["MessageThreadDetailTableVC.cell"].staticTexts[messageText].exists)
         
    }
    
    func assertMessageCellExists(forMessage messageText: String, from sender: String) {
        assertMessageCellExists(forMessage: messageText)
        XCTAssertTrue(app.tables.cells["MessageThreadDetailTableVC.cell"].staticTexts[sender].exists)
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
        app.navigationBars.buttons["Back"].tap()
    }
    
    var createThreadTextField: XCUIElement {
        app.tables.textFields["MessageThreadsTableVC.createNewThread"]
    }
    
    var messageSenderTextField: XCUIElement {
        app.tables.textFields["MessageThreadDetailTableVC.SenderName"]
    }
    
    func tapToAddMsgBtn() {
        app.buttons["Add"].tap()
    }
    
    func tapMessageCell(with messageText: String) {
        assertMessageCellExists(forMessage: messageText)
        app.tables.cells["MessageThreadDetailTableVC.cell"].staticTexts[messageText].tap()
    }
    
    func tapThreadCell(withTitle threadTitle: String) {
        app.tables.cells.matching(identifier: "MessageThreadsTableVC.threadCell").staticTexts[threadTitle].tap()
    }

    

    
}
