//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app : XCUIApplication = XCUIApplication()
    var messageThreadsTableVC : MessageThreadsTableViewController?
    var messageThreadController : MessageThreadController?
    
    override func setUp() {
        super.setUp()
        messageThreadsTableVC = MessageThreadsTableViewController()
        messageThreadController = MessageThreadController()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testAPostingMessage(){
        let tableView = app.tables.containing(.table, identifier: "MainTableView")
        let initialNumber = tableView.cells.count
        let textField = app.otherElements.textFields["MainTextField"]
        textField.tap()
        textField.typeText("Testing adding new")
        app.buttons["Return"].tap()
        let newNumber = tableView.cells.count
        var testBool = false
        if newNumber > initialNumber{
            testBool = true
        }
        XCTAssert(testBool)
        
    }
    
    func testNavigatingIntoMessage(){
        let tableView = app.tables.containing(.table, identifier: "MainTableView")
        messageThreadsTableVC?.retrieveMessages {
            tableView.cells.element(boundBy: 0).tap()
            XCTAssert(self.app.navigationBars["\(self.messageThreadsTableVC!.messageThreadController.messageThreads[0].title )"].exists)
        }        
    }
    
    
    
}
