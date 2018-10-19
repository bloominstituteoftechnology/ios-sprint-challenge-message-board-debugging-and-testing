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
    
    // Probably failed because I need to get it to the right view controller when test was only run on view loaded.
    // The test below succeeding basically proves it.
    func testMessageToDetailMessageView() {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.tableRows["MessageThreadDetailTableView"].exists)
        
        app.cells.element(boundBy: 1).tap()
        
        XCTAssertFalse(app.tableRows["MessageThreadDetailTableView"].exists)
        XCTAssertTrue(app.tableRows["MessageDetailView"].exists)
        
        //app.messagesButton().tap()
    }
    
    // Maybe not these failed too. 
    func testMessageTreadView() {
        let app = XCUIApplication()
        XCTAssertTrue(app.tableRows["MessageThreadsTableView"].exists)
    }
    
    func testMessageTreadViewToMessageView() {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.tableRows["MessageThreadsTableView"].exists)
        
        app.cells.element(boundBy: 1).tap()
        
        XCTAssertFalse(app.tableRows["MessageThreadsTableView"].exists)
        XCTAssertTrue(app.tableRows["MessageThreadDetailTableView"].exists)
        
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        
        
    }
    
}
