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
    
    var createNewMessage: XCUIElement {
        let app = XCUIApplication()
        return app.textFields["MassageBoard.create"]
    }
    
    var messageCell: XCUIElement {
        let app = XCUIApplication()
        return app.cells["MassageBoard.cell"]
    }
    
    func testcreateNewMessage() {
        
        createNewMessage.tap()
        createNewMessage.typeText("Testing")
        createNewMessage.typeText("\n")
    }
    
    func testTapToCell() {
        createNewMessage.tap()
        createNewMessage.typeText("TestingTapToCell")
        createNewMessage.typeText("\n")
        messageCell.tap()
    }
    
    // Massage Board Detail
    var mainNavigationBackButton: XCUIElement {
        let app = XCUIApplication()
        return app.buttons["λ Message Board"]
    }
    
    var navigationAddButton: XCUIElement {
        let app = XCUIApplication()
        return app.buttons["TitleScene.addButton"]
    }
    var messageCellInDetait: XCUIElement {
        let app = XCUIApplication()
        return app.cells["TitleScene.cell"]
    }
    
    
    
    
    func testBackButtonTap() {
        createNewMessage.tap()
        createNewMessage.typeText("TestingTapToCell")
        createNewMessage.typeText("\n")
        messageCell.tap()
        mainNavigationBackButton.tap()
    }
    
    func testnavigationAddButtonTap() {
        createNewMessage.tap()
        createNewMessage.typeText("TestingTapToCell")
        createNewMessage.typeText("\n")
        messageCell.tap()
        navigationAddButton.tap()
    }
    func testTapODetailCell() {
        createNewMessage.tap()
        createNewMessage.typeText("TestingTapToCell")
        createNewMessage.typeText("\n")
        messageCell.tap()
        navigationAddButton.tap()
        enterNewMessageText.tap()
        enterNewMessageText.typeText("TestingTextField")
        navigationSendButton.tap()
        detailNvigationBackButton.tap()
        messageCellInDetait.tap()
    }
    
    
    
    // message detail
    
    var enterNewMessageText: XCUIElement {
        let app = XCUIApplication()
        return app.textFields["NewMessageScen.newMessage"]
    }
    
    var enterNewMessageDescription: XCUIElement {
        let app = XCUIApplication()
        return app.textViews["NewMessageScen.newMessageDescription"]
    }
    
    var navigationSendButton: XCUIElement {
        let app = XCUIApplication()
        return app.navigationBars.buttons["NewMessageScen.sendButton"]
    }
    
    var detailNvigationBackButton: XCUIElement {
        let app = XCUIApplication()
        return app.navigationBars.buttons["TestingTapToCell"]
    }
    
    func testEnterTextNameOnNewMessage() {
        createNewMessage.tap()
        createNewMessage.typeText("TestingTapToCell")
        createNewMessage.typeText("\n")
        messageCell.tap()
        navigationAddButton.tap()
        enterNewMessageText.tap()
        enterNewMessageText.typeText("TestingTextField")
    }
    
    func testEnterTextOnNewMessageDescripton() {
        createNewMessage.tap()
        createNewMessage.typeText("TestingTapToCell")
        createNewMessage.typeText("\n")
        messageCell.tap()
        navigationAddButton.tap()
        enterNewMessageText.tap()
        enterNewMessageText.typeText("TestingTextField")
        enterNewMessageText.typeText("\n")
        enterNewMessageDescription.tap()
        enterNewMessageDescription.typeText("Hello")
    }
    
    func testSendButton() {
        createNewMessage.tap()
        createNewMessage.typeText("TestingTapToCell")
        createNewMessage.typeText("\n")
        messageCell.tap()
        navigationAddButton.tap()
        enterNewMessageText.tap()
        enterNewMessageText.typeText("TestingTextField")
        navigationSendButton.tap()
    }
    
    
    func testCteateNewMassageAndBackButton() {
        createNewMessage.tap()
        createNewMessage.typeText("TestingTapToCell")
        createNewMessage.typeText("\n")
        messageCell.tap()
        navigationAddButton.tap()
        enterNewMessageText.tap()
        enterNewMessageText.typeText("TestingTextField")
        navigationSendButton.tap()
        detailNvigationBackButton.tap()
    }
    
}
