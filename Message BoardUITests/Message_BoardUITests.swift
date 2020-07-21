//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
  
  private var app: XCUIApplication!
  
  private var textField: XCUIElement {
    return app.textFields["MessageThreadsTableViewController.TextField"]
  }
  
  private var navTitle: XCUIElement {
    return app.navigationBars["λ Message Board"].staticTexts["λ Message Board"]
  }
  
  private var firstTableCell: XCUIElement {
    return app.tables.element(boundBy: 0)
  }
  
  private var senderNameTextField: XCUIElement {
    return app.textFields["NameTextField"]
  }
  
  
  private var messageTextView: XCUIElement {
    return app.textViews["MessageTextView"]
  }
  
  private var rightBarButtonItem : XCUIElement {
    return app.navigationBars.buttons["Right Bar Button Item"]
  }
  override func setUp() {
    super.setUp()
    
    continueAfterFailure = false
    app = XCUIApplication()
    
    // NOTE: Keep this setup as is for UI Testing
    app.launchArguments = ["UITesting"]
    app.launch()
  }
  private var threadTextField: XCUIElement {
    return app.tables.textFields["Create a new thread:"]
  }
  
  
  func testFirstLaunch() {
    XCTAssertTrue(navTitle.exists)
    XCTAssertEqual(textField.placeholderValue!, "Create a new thread:")
  }
  
  func testCreateThread() {
    threadTextField.tap()
    threadTextField.typeText("UITest")
    app.keyboards.buttons["Return"].tap()
    XCTAssertTrue(app.tables.staticTexts["UITest"].exists)
  }
  
  func testCreateAnotherThread() {
    threadTextField.tap()
    threadTextField.typeText("Another Text")
    app.keyboards.buttons["Return"].tap()
    XCTAssertTrue(app.tables.staticTexts["Another Text"].exists)
  }
  private var detailRightBarButtonItem : XCUIElement {
    return app.navigationBars.buttons["Detail Right Bar Button Item"]
  }
  
  
  func testAddMessage() {
    app.tables.staticTexts["A New Thread"].tap()
    XCTAssertTrue(app.tables.staticTexts["Checking to make sure this works."].exists)
    rightBarButtonItem.tap()
    senderNameTextField.typeText("Hello World")
    messageTextView.tap()
    detailRightBarButtonItem.tap()
    XCTAssertTrue(app.tables.staticTexts["Hello World"].exists)
    XCTAssertTrue(app.tables.staticTexts["Message"].exists)
    
  }
}
