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
        let app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    

       func test_Newthread() {
           XCTAssertTrue(createThreadTextField.exists)
           createThreadTextField.tap()

           for key in appKeysWithTest1 {
               XCTAssertTrue(key.exists)
               key.tap()
           }

           XCTAssertTrue(returnKey.exists)
           returnKey.tap()

           XCTAssertTrue(cellTest1)

        
        func test_navigateToTest1() {
               test_Newthread()
               cellTest1.tap()
               XCTAssertTrue(navTest1.exists)
           }

           func test_createMessage() {
               test_navigateToTest1()

               navTest1.buttons["Add"].tap()

        
        
           }
    
       }

       var app: XCUIApplication {
           return XCUIApplication()
       }

       var createThreadTextField: XCUIElement {
           return app.tables.textFields["Create a new thread:"]
       }

       var appKeysWithTest1: [XCUIElement] {
           return [app.keys["t"], app.keys["e"], app.keys["s"], app.keys["t"], app.keys["space"] ,app.keys["more"], app.keys["1"]]
       }
    
    var cellTest1: XCUIElement {
         return app.tables.staticTexts["test 1"]
     }

       var returnKey: XCUIElement {
           return app.buttons["Return"]
       }
    var navTest1: XCUIElement {
         return app.navigationBars["test 1"]
     }
}
