//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication {
        XCUIApplication()
    }
    
    var functionalityTest: Bool {
        //Testing Basic UI Functionality
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["FOR TESTING PURPOSES DO NOT DELETE"]/*[[".cells.staticTexts[\"FOR TESTING PURPOSES DO NOT DELETE\"]",".staticTexts[\"FOR TESTING PURPOSES DO NOT DELETE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let forTestingPurposesDoNotDeleteNavigationBar = app.navigationBars["FOR TESTING PURPOSES DO NOT DELETE"]
        forTestingPurposesDoNotDeleteNavigationBar.buttons["Add"].tap()
        app.navigationBars["New Message"].buttons["FOR TESTING PURPOSES DO NOT DELETE"].tap()
        forTestingPurposesDoNotDeleteNavigationBar.buttons["λ Message Board"].tap()
        return true
    }
    
    var swipeTest: Bool {
        //UI Swiping Test
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["FOR TESTING PURPOSES DO NOT DELETE"]/*[[".cells.staticTexts[\"FOR TESTING PURPOSES DO NOT DELETE\"]",".staticTexts[\"FOR TESTING PURPOSES DO NOT DELETE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let forTestingPurposesDoNotDeleteNavigationBar = app.navigationBars["FOR TESTING PURPOSES DO NOT DELETE"]
        forTestingPurposesDoNotDeleteNavigationBar.buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        forTestingPurposesDoNotDeleteNavigationBar.buttons["λ Message Board"].tap()
        return true
    }
    
    var addMessageToThread: Bool {
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["FOR TESTING PURPOSES DO NOT DELETE"]/*[[".cells.staticTexts[\"FOR TESTING PURPOSES DO NOT DELETE\"]",".staticTexts[\"FOR TESTING PURPOSES DO NOT DELETE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let forTestingPurposesDoNotDeleteNavigationBar = app.navigationBars["FOR TESTING PURPOSES DO NOT DELETE"]
        forTestingPurposesDoNotDeleteNavigationBar.buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["NewMessage"]/*[[".cells.staticTexts[\"NewMessage\"]",".staticTexts[\"NewMessage\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        forTestingPurposesDoNotDeleteNavigationBar.buttons["λ Message Board"].tap()
        return true
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
        
        //Make a thread
    }
    
    func testExample() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //Tests
        XCTAssertTrue(functionalityTest)
        XCTAssertTrue(addMessageToThread)
        XCTAssertTrue(swipeTest)
        

    }
    
    
    
}
