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
	
	
	func keyboardWithTest7() {
		
		for key in appKeysWithTest7 {
			XCTAssertTrue(key.exists)
			key.tap()
		}
	}
	
	func test_createNewthread() {
		XCTAssertTrue(createThreadTextField.exists)
		createThreadTextField.tap()
		
		keyboardWithTest7()
		
		XCTAssertTrue(returnKey.exists)
		returnKey.tap()
		
		XCTAssertTrue(cellTest7.exists)
	}
	
	func test_navigatoToTest7() {
		test_createNewthread()
		cellTest7.tap()
		XCTAssertTrue(navTest7.exists)
	}
	
	func test_navigatoCreateMessage() {
		test_navigatoToTest7()
		XCTAssertTrue(addMessageButton.exists)
		addMessageButton.tap()
		XCTAssertTrue(navNewMessage.exists)
		XCTAssertTrue(createMessageNameTextField.exists)
		XCTAssertTrue(createMessageBodyTextField.exists)
		XCTAssertTrue(createMessageSendButton.exists)
		XCTAssertTrue(createMessageBackButton.exists)
	}
	
	func test_createMessage() {
		test_navigatoCreateMessage()
		
		createMessageNameTextField.tap()
		keyboardWithTest7()
		returnKey.tap()
		
		createMessageBodyTextField.tap()
		app.buttons["shift"].tap()
		keyboardWithTest7()
		
		createMessageSendButton.tap()
		createMessageBackButton.tap()
		
		XCTAssertTrue(cellTest7.exists)
	}
	
	var app: XCUIApplication {
		return XCUIApplication()
	}
	
	var createThreadTextField: XCUIElement {
		return app.tables.textFields["Create a new thread:"]
	}
	
	var appKeysWithTest7: [XCUIElement] {
		return [app.keys["t"], app.keys["e"], app.keys["s"], app.keys["t"], app.keys["space"] ,app.keys["more"], app.keys["7"]]
	}
	
	var cellTest7: XCUIElement {
		return app.tables.staticTexts["test 7"]
	}
	
	var returnKey: XCUIElement {
		return app.buttons["Return"]
	}
	
	var navTest7: XCUIElement {
		return app.navigationBars["test 7"]
	}
	var addMessageButton: XCUIElement {
		return navTest7.buttons["Add"]
	}
	
	var navNewMessage: XCUIElement {
		return app.navigationBars["New Message"]
	}
	
	var createMessageNameTextField: XCUIElement {
		return app.textFields["Enter your name:"]
	}
	
	var createMessageBodyTextField: XCUIElement {
		return app.textViews["NewMessage.TextView"]
	}

	var createMessageSendButton: XCUIElement {
		return app.navigationBars["New Message"].buttons["Send"]
	}
	var createMessageBackButton: XCUIElement {
		return app.navigationBars["New Message"].buttons["test 7"]
	}
}
