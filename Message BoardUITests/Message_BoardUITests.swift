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
    private var messageTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.TextView"]
    }

    private var messageName: XCUIElement {
        return app.textFields["MessageDetailViewController.NameTextField"]
    }
    
    private var messageSearch: XCUIElement {
        return app.searchFields["MessageThreadsTableViewController.Search"]
    }
    
    func testCreatingMessage() {
    
      
        let threadName = "New Entry"
         let name = "Bharat"
         let message = "Hello, world!"
        
         messageName.tap()
         messageName.typeText(threadName)
         app.keyboards.buttons["Return"].tap()
         app.tables.cells["2"].tap()
         app.buttons["Add"].tap()
         
         messageName.tap()
         messageName.typeText(name)

         messageTextView.tap()
        messageTextView.typeText(message)

         app.buttons["Send"].tap()
         
         // Send button should take us back to MessageThreadDetailTableViewController
         XCTAssertTrue(app.staticTexts[message].exists)

    }
    
    func testCreatingNewThread() {
          messageSearch.tap()
          messageSearch.typeText("New Thread Message \n")
      }
      
      func testReadingThreadsAndMessages() {
          let tablesQuery = app.tables
          tablesQuery.staticTexts["new creation"].tap()
          tablesQuery.staticTexts["hi"].tap()
          
      }
    
   
    
}
