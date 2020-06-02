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
        return XCUIApplication()
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
//        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    //This test is checking to make sure that a Message Thread is populated within
    func testMessageBoardPopulation() {
//
        let searchBar = app.tables.textFields["Create a new thread:"]
        app.tables.textFields["Create a new thread:"].tap()
        
        let hKey = app.keys["h"]
        hKey.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        let yKey = app/*@START_MENU_TOKEN@*/.keys["y"]/*[[".keyboards.keys[\"y\"]",".keys[\"y\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        yKey.tap()
        
        XCTAssert("hey" == searchBar.value as! String, "Error: The text that I used did not match the tested String")
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    // This test is checking to make sure that no empty Message Thread can be populated. This must have text within the textfield
    func testdetailVCSendButton() {
        
        let searchBar = app.tables.textFields["Create a new thread:"]
        app.tables.textFields["Create a new thread:"].tap()
        let tKey = app.keys["t"]
        tKey.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        let sKey = app.keys["s"]
        sKey.tap()
        
        tKey.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["test"].tap()
        
        
        app.navigationBars["test"].buttons["Add"].tap()
        
        app.textFields["Enter your name:"].tap()
                
        tKey.tap()
        
        eKey.tap()
        
        sKey.tap()
        
        tKey.tap()
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        
        app.navigationBars["New Message"].buttons["Send"].tap()

    }
    
    func testLastMessageCreation() {
        let searchBar = app.tables.textFields["Create a new thread:"]
        app.tables.textFields["Create a new thread:"].tap()
        
        let tKey = app.keys["t"]
        tKey.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        
        let sKey = app.keys["s"]
        sKey.tap()
        
        tKey.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let lastCell = app.tables.allElementsBoundByIndex.last?.staticTexts[searchBar.value as! String]
        XCTAssert(lastCell!.exists, "Error: A cell was not placed at the bottom of the TableView")
        

    }
    
}
