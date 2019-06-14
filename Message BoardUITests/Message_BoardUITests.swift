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

	var cellNewThread: XCUIElement {
		let cell = app.tables.staticTexts["A New Thread"]
		XCTAssertTrue(cell.exists)
		return cell
	}

	var cellTestingAgain: XCUIElement {
		let cell = app.tables.staticTexts["Testing again"]
		XCTAssertTrue(cell.exists)
		return cell
	}

	var backButtonText = "λ Message Board"

	func tapElement(element: XCUIElement) {
		XCTAssertTrue(element.isHittable)
		element.tap()
	}

    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }

	func testViewMessageThread() {
		tapElement(element: cellNewThread)
		app/*@START_MENU_TOKEN@*/.staticTexts["Checking to make sure this works."]/*[[".cells.staticTexts[\"Checking to make sure this works.\"]",".staticTexts[\"Checking to make sure this works.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
		let backButton = app.navigationBars["A New Thread"].buttons[backButtonText]
		tapElement(element: backButton)

		tapElement(element: cellTestingAgain)
		let backButton2 = app.navigationBars["Testing again"].buttons[backButtonText]
		tapElement(element: backButton2)
	}

	func testCreateThread() {
		let textField = app.textFields["Create a new thread:"]
		tapElement(element: textField)

		textField.typeText("UITest New Thread\n")

		let newCell = app.staticTexts["UITest New Thread"]
		tapElement(element: newCell)
		let backButton = app.navigationBars["UITest New Thread"].buttons[backButtonText]
		tapElement(element: backButton)

	}

	func testCreateNewMessage() {
		let message = "It's working... It's working!"


		tapElement(element: cellNewThread)
		tapElement(element: app.buttons["Add"])
		let nameField = app.textFields["MessageDetail.nameField"]
		tapElement(element: nameField)
		nameField.typeText("UITester Person")


		let textField = app.textViews["MessageDetail.messageTextField"]
		tapElement(element: textField)
		textField.typeText(message)
		tapElement(element: app.navigationBars["New Message"].buttons["Send"])

		XCTAssertTrue(app.staticTexts[message].exists)
	}
    
}
