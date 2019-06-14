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
		let backButton = app.navigationBars["A New Thread"].buttons["λ Message Board"]
		tapElement(element: backButton)

		tapElement(element: cellTestingAgain)
		let backButton2 = app.navigationBars["Testing again"].buttons["λ Message Board"]
		tapElement(element: backButton2)
	}
    
}
