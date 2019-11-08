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
    
    func testCreateNewThread() {
        let threadTextField = app.tables.textFields["MessageThreadsTableViewController.CreateNewThread"]
        let greatestThread = "Greatest Thread!"
        let greatestThreadCell = app.tables.cells.staticTexts[greatestThread]
        
        threadTextField.tap()
        threadTextField.typeText(greatestThread)
        app.keyboards.buttons["return"].tap()
        XCTAssertTrue(greatestThreadCell.exists)
    }
    
    func testAddMessageToThread() {
        let title = "A New Thread"
        
        app.tables.cells.staticTexts[title].tap()
        app.navigationBars[title].buttons["Add"].tap()
        
        let titleTextField = app.textFields["MessageDetailViewController.MessageTitle"]
        titleTextField.tap()
        titleTextField.typeText("Something New!")
        
        let messageTextField = app.textViews["MessageDetailViewController.MessageText"]
        messageTextField.tap()
        messageTextField.typeText("This is going to be a new message and it is going to be awesome!")
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        XCTAssertTrue(app.tables.cells.count > 1)
    }
    
    func testLookAtTwoThreads() {
        let title = "A New Thread"
        let title2 = "Testing again"
        let header = app.navigationBars[title]
        let header2 = app.navigationBars[title2]
        let cell = app.tables.cells.staticTexts
     
        cell[title].tap()
        XCTAssert(header.exists)
        header.buttons["λ Message Board"].tap()
        
        XCTAssertTrue(cell[title2].exists)
        XCTAssertTrue(cell[title].exists)
        
        cell[title2].tap()
        XCTAssert(header2.exists)
        header2.buttons["λ Message Board"].tap()
        
        XCTAssertTrue(cell[title2].exists)
        XCTAssertTrue(cell[title].exists)
    }
    
}
