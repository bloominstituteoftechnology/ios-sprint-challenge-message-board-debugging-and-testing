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
  private var nameTextField: XCUIElement {
         return app.textFields["NameTextField"]
     }
     
     private var messageTextView: XCUIElement {
         return app.textViews["MessageTextView"]
     }
     
     private var searchBar: XCUIElement {
         return app.textFields["MessageThreadsTableViewController.Search"]
     }
     
     func testCreatingNewMessage() {
        


           let threadName = "New Entry"
        
        // Create a new thread
        app.textFields["MessageThreadsTableViewController.Search"].tap()
        app.textFields["MessageThreadsTableViewController.Search"].typeText(threadName)
        app.keyboards.buttons["Return"].tap()

        // Tap the cell we just added
        app.tables.cells["0"].tap()
        
        // Advance to MessageThreadDetailTableViewController
        app.buttons["Add"].tap()
       
        // Advance to MessageDetailViewController

        messageTextView.tap()
        messageTextView.typeText("Message\n")

        app.buttons["Send"].tap()
        
        // Send button should take us back to MessageThreadDetailTableViewController
        XCTAssertTrue(app.staticTexts["Message\n"].exists)
        
     }
     
     func testCreatingNewThread() {
         searchBar.tap()
         searchBar.typeText("New Thread\n")
     }
     
     func testReadingThreadsAndMessages() {
        
    let threadName = "New Entry"
        
        // Create a new thread
//        I didn't used the properties as it was giving me some errors before.
        app.textFields["MessageThreadsTableViewController.Search"].tap()
        app.textFields["MessageThreadsTableViewController.Search"].typeText(threadName)
        app.keyboards.buttons["Return"].tap()
              
         
     }
    
   
    
}
