//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
	
	func test_createNewthread() {
		XCTAssertTrue(createThreadTextField.exists)
		createThreadTextField.tap()

		for key in appKeysWithTest9 {
			XCTAssertTrue(key.exists)
			key.tap()
		}
		
		XCTAssertTrue(returnKey.exists)
		returnKey.tap()
		
		XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["test 7"]/*[[".cells.staticTexts[\"test 7\"]",".staticTexts[\"test 7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

		
	}
	
	var app: XCUIApplication {
		return XCUIApplication()
	}
	
	var createThreadTextField: XCUIElement {
		return app.tables.textFields["Create a new thread:"]
	}
	
	var appKeysWithTest9: [XCUIElement] {
		return [app.keys["t"], app.keys["e"], app.keys["s"], app.keys["t"], app.keys["space"] ,app.keys["more"], app.keys["7"]]
	}
	
	var returnKey: XCUIElement {
		return app.buttons["Return"]
	}
	
}
