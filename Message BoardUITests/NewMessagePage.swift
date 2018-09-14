//
//  NewMessagePage.swift
//  Message BoardUITests
//
//  Created by William Bundy on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct NewMessagePage: TestPage
{
	var testCase:XCTestCase

	var nameField:XCUIElement {
		return app.textFields["Detail.nameField"]
	}

	var messageField:XCUIElement {
		return app.textViews["Detail.messageField"]
	}

	var sendButton:XCUIElement {
		return app.navigationBars.buttons["Detail.send"]
	}

	var firstCell:XCUIElement {
		return app.tableRows["Messages.cell0"]
	}


	@discardableResult
	func verifyMessageSend(file:String, line:UInt) -> NewMessagePage
	{
		testCase.expect(exists: nameField, file:file, line:line)
		nameField.tap()
		nameField.typeText("Test User")
		testCase.expect(exists:messageField, file:file, line:line)
		messageField.tap()
		messageField.typeText("Hello, World!")
		testCase.expect(exists:sendButton, file:file, line:line)
		sendButton.tap()

		testCase.expect(exists:firstCell, file:file, line:line)
		testCase.expect(firstCell.label, equals: "Hello, World!")

		return self
	}
}
