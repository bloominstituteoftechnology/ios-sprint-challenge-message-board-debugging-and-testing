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
    
    
    //MARK: - Testing methods
    
    /// testing fetching local message thread from mock data
    func testFetchingMessageThread() {
        
        let app = XCUIApplication()
        let fetchMessageThreadExpectaion = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.tables.cells)
        
        fetchMessageThreadExpectaion.expectationDescription = "expecting 2 thread messages to be fetched from mock data"
        XCTAssert(testCreatedMessageThreadCell(name: "A New Thread"))
        XCTAssert(testCreatedMessageThreadCell(name: "Testing again"))
        waitForExpectations(timeout: 2)
    }
    
    ///testing fetching local message from mock data
    func testFetchANewThreadLocalMessages() {
        
        let app = XCUIApplication()
        app.tables.cells.staticTexts["A New Thread"].tap()
        let fetchMessageThreadExpectaion = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith:app.tables.cells)
        fetchMessageThreadExpectaion.expectationDescription = "expecting messages to be fetched from the message thread"
        XCTAssert(testCreatLocalMessageCell(name: "Joe"))
        waitForExpectations(timeout: 1)
    }
    
    func testFetchUnitTestingLocalMessages() {
        
        let app = XCUIApplication()
        app.tables.cells.staticTexts["Testing again"].tap()
        let fetchMessageThreadExpectaion = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith:app.tables.cells)
        fetchMessageThreadExpectaion.expectationDescription = "expecting messages to be fetched from the message thread"
        XCTAssert(testCreatLocalMessageCell(name: "Bob"))
        waitForExpectations(timeout: 1)
    }
    

    
    /// tests the creation of a new local message thread..
    func testCreateMessageThread() {
        
        let app = XCUIApplication()
         let createMessageThread = app.textFields["Create a new thread:"]
         createMessageThread.tap()
         createMessageThread.typeText("baby shower")
         app.buttons["Return"].tap()
        XCTAssert(testCreatedMessageThreadCell(name:"baby shower"))
    }
    
    /// testing the creating a new message in message thread
    func testCreateLocalMessage() {
        
        
  let app = XCUIApplication()
      testCreateMessageThread()
      app.tables.cells.staticTexts["baby shower"].tap()
      app.navigationBars["baby shower"].buttons["Add"].tap()
           
      let nameTextfield = app.textFields["Enter your name:"]
      nameTextfield.tap()
      nameTextfield.typeText("brian")
       
       let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView)
        textView.element.tap()
        textView.element.typeText("testing message")
        
        app.navigationBars["New Message"].buttons["Send"].press(forDuration: 0.2)
        XCTAssert(testCreatLocalMessageCell(name: "testing message"))
        XCTAssert(testCreatLocalMessageCell(name: "brian"))

    }
    
    
  // MARK: - helper methods
  private func testCreatedMessageThreadCell(name: String) -> Bool {
        let app = XCUIApplication()
        if app.tables.cells.staticTexts[name].exists {
            return true
        } else {
            return false
            
        }
    }
    
    private func testCreatLocalMessageCell(name: String) -> Bool {
          let app = XCUIApplication()
          if app.tables.cells.staticTexts[name].exists {
              return true
          } else {
              return false
              
          }
      }
}
