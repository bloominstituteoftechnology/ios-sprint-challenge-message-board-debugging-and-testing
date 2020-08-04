//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testMessageBoardTableView() {
        app.launchArguments = ["UITesting"]
        app.launch()

        let tableView = app.tables.firstMatch

        XCTAssert(tableView.exists)
    }

    func testTitleDisplays() {
        app.navigationBars["λ Message Board"].staticTexts["λ Message Board"].tap()

        XCTAssert(app.navigationBars["λ Message Board"].exists)
    }

    func testTableViewText() {


        let tablesQuery = app.tables
        tablesQuery.staticTexts["A New Thread"].tap()
        tablesQuery.staticTexts["Checking to make sure this works."].tap()
        tablesQuery.staticTexts["Joe"].tap()
        

        XCTAssert(tablesQuery.staticTexts["Checking to make sure this works."].exists)
    }

    func testCreateNewMessage() {

        let tablesQuery = app.tables
        tablesQuery.staticTexts["A New Thread"].tap()
        app.navigationBars["A New Thread"].buttons["Add"].tap()

        let newmessagesenderTextField = app/*@START_MENU_TOKEN@*/.textFields["NewMessageSender"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"NewMessageSender\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        newmessagesenderTextField.tap()
        app.textViews["NewMessageText"].tap()

        let hKey = app/*@START_MENU_TOKEN@*/.keys["H"]/*[[".keyboards.keys[\"H\"]",".keys[\"H\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hKey.tap()


        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()


        let lKey = app/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
        lKey.tap()

        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()

        newmessagesenderTextField.tap()

        let jKey = app/*@START_MENU_TOKEN@*/.keys["j"]/*[[".keyboards.keys[\"j\"]",".keys[\"j\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        jKey.tap()
        oKey.tap()

        let hKey2 = app/*@START_MENU_TOKEN@*/.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hKey2.tap()

        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nKey.tap()

        app.navigationBars["New Message"].buttons["Send"].tap()
        sleep(3)

        XCTAssert(app.navigationBars["A New Thread"].exists)
    }
}
