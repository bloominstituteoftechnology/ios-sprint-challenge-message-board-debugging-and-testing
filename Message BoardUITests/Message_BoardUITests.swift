//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
 
    private var searchBar: XCUIElement {
        return app.tables["Empty list"].textFields["Create a new thread:"]
     
    }
    

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        

        app.launchArguments = ["UITesting"]
        app.launch()
    }
    

    func testSearchbarEnters() {
        let cell = app.cells.element(boundBy: 0)
        searchBar.tap()
        searchBar.typeText("Testing")
        app.buttons["Return"].tap()
        XCTAssert(cell.exists)
    }
    
   
    func testFirstBackBar() {
        let cell = app.cells.element(boundBy: 0)
        searchBar.tap()
        searchBar.typeText("Testing")
        app.buttons["Return"].tap()
        cell.tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssert(cell.exists)
    }

}
