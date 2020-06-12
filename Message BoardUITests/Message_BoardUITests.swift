//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    //MARK: - Types -
    enum StringID: String {
        case createNew = "Create a new thread:"
        case testing = "Testing"
        case addName = "Enter your name:"
        case newMessage = "New Message"
        case title = "Title"
    }
    
    
    //MARK: - Properties -
    var app = XCUIApplication()
    var newThreadField: XCUIElement {
        return app.tables.textFields[StringID.createNew.rawValue]
    }
    var returnButton: XCUIElement {
        return app.keyboards.buttons["Return"]
    }
    var addReplyButton: XCUIElement {
        return app.navigationBars[StringID.title.rawValue].buttons["Add"]
    }
    var nameField: XCUIElement {
        return app.textFields[StringID.addName.rawValue]
    }
    var addMessage: XCUIElement {
        return app.navigationBars[StringID.newMessage.rawValue].buttons["Send"]
    }
    
    
    //MARK: - Test Evironment Parameters -
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    //MARK: - Methods -
    private func getCell(for string: String) -> XCUIElement {
        return app.tables.children(matching: .cell).element.staticTexts["\(string)"]
    }
    
    
    //MARK: - Tests -
    func testPostAndUpdate() {
        //check the two tester posts
        XCTAssertEqual(app.tables.cells.count, 2)
        newThreadField.tap()
        newThreadField.typeText(StringID.testing.rawValue)
        returnButton.tap()
        //see if a third is added
        XCTAssertEqual(app.tables.cells.count, 3)
    }
    
    func testPostReplyAndPop() {
        //create a message to reply to
        newThreadField.tap()
        newThreadField.typeText(StringID.testing.rawValue)
        returnButton.tap()
        
        //reply to message
        let testThreadCell = getCell(for: StringID.testing.rawValue)
        testThreadCell.tap()
        addReplyButton.tap()
        nameField.tap()
        nameField.typeText("Disagreeable123")
        addMessage.tap()
        
        //Page dismisses so we should be looking at a tableview with 3 cells on it.
        XCTAssertEqual(app.tables.cells.count, 3)
    }
    
}
