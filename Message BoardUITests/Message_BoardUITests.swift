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


        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["MessageTest"]/*[[".cells.matching(identifier: \"CreatedMessages\").staticTexts[\"MessageTest\"]",".staticTexts[\"MessageTest\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Test Message"]/*[[".cells[\"MessageText\"].staticTexts[\"Test Message\"]",".staticTexts[\"Test Message\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sender: Josh"]/*[[".cells[\"MessageText\"].staticTexts[\"Sender: Josh\"]",".staticTexts[\"Sender: Josh\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        

        XCTAssert(tablesQuery.staticTexts["MessageTest"].exists)
    }

}
