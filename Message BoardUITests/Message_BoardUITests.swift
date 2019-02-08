//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
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
    var navigationBackButton: XCUIElement {
        let app = XCUIApplication()
        return app.buttons["TitleScene.backButton"]
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
        //navigationBackButton.tap()
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
       // messageCellInDetait.tap()
    }
    
    
    
    // message detail
    
    
}
