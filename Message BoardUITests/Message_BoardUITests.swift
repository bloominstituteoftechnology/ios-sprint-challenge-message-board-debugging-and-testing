//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    //MARK: Properties
    var app = XCUIApplication()

    
    private var appDescription: String {
        return app.debugDescription
    }
    
    private var newThreadTextField: XCUIElement {
        return app.tables.textFields["CreateNewThreadTextField"]
    }
    
    private func threadString(thread: String) -> XCUIElement {
        return app.keys[thread]
    }
    
    private func threadCell(for thread: String) -> XCUIElementQuery {
        return app.tables.matching(identifier: thread)
    }
    
    
    
    //MARK: SetUp Function
   override func setUp() {
           super.setUp()
           
           continueAfterFailure = false
           app = XCUIApplication()
           
           // NOTE: Keep this setup as is for UI Testing
           app.launchArguments = ["UITesting"]
           app.launch()
       }
    
    //MARK: UITests
    func testAddingNewThread() {
        
        newThreadTextField.tap()
        newThreadTextField.typeText("New Thread")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertNotNil(app.tables["New thread"])
        
    }
    
    
    func testBackToTableVCButton() {
        
        newThreadTextField.tap()
        newThreadTextField.typeText("Second Thread")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()

        let newThreadCell = app.tables.staticTexts["Second Thread"]
        newThreadCell.tap()
        
        app.navigationBars["Second Thread"].buttons["λ Message Board"].tap()
        
        XCTAssertNotNil(app.tables.staticTexts["λ Message Board"])
    }
    
    func testHowAccessibilityLooks() {
        print(appDescription)
        
    }
    
    func testAddingNewMessage() {
        
        newThreadTextField.tap()
        newThreadTextField.typeText("New People")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let messageBoardTV = app.tables
      
        messageBoardTV.staticTexts["New People"].tap()
        
        let addButton = app.navigationBars["New People"].buttons["Add"]
            addButton.tap()
        
        let nameTextField = app.textFields["Enter your name:"]
            nameTextField.tap()
        nameTextField.typeText("Anna")
        
      
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        app/*@START_MENU_TOKEN@*/.keys["G"]/*[[".keyboards.keys[\"G\"]",".keys[\"G\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
     
        let sendButton = app.navigationBars["New Message"].buttons["Send"]
            sendButton.tap()
        
        XCTAssertNotNil(app.navigationBars["New People"])
        XCTAssertNotNil(app.textFields["Anna"])
        
    }
}
