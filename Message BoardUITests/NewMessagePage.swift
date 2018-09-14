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
		return app.navigationBars.buttons["Detail.sendButton"]
	}

	var firstCell:XCUIElement {
		return app.tables["Messages.table"].cells["Messages.cell0"]
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

		// lol?
		_ = firstCell.waitForExistence(timeout: 10)
		testCase.expect(exists:firstCell, file:file, line:line)
		let label = firstCell.staticTexts["Messages.cell0.label"]
		testCase.expect(exists:label, file:file, line:line)
		testCase.expect(label.label, equals: "Hello, World!")
		let detail = firstCell.staticTexts["Messages.cell0.detail"]
		testCase.expect(exists:detail, file:file, line:line)
		testCase.expect(detail.label, equals: "Test User")

		return self
	}
}
