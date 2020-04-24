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
    
    func testAddNewThread() throws {
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery.textFields["Create a new thread:"].tap()
        app.textFields["Create a new thread:"].clearAndEnterText(text: "Lullaby")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.staticTexts["Lullaby"].tap()
        
        
    }
    
    func testAddNewMessage() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        
        app.tables.staticTexts["Ode"].tap()
        app.navigationBars["Ode"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.textFields["Enter your name:"].clearAndEnterText(text: "Lyrics")
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        
        textView.tap()
        textView.typeText("Ode To Joy")
        
        let newMessageNavigationBar = app.navigationBars["New Message"]
        newMessageNavigationBar.buttons["Send"].tap()
        newMessageNavigationBar.buttons["Ode"].tap()
    }
    
}
// Add a comment with the source and attribution (StackOverflow URL)
// https://stackoverflow.com/questions/32821880/ui-test-deleting-text-in-text-field
extension XCUIElement {
    
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        
        self.tap()
        
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        
        self.typeText(deleteString)
        self.typeText(text)
    }
}
