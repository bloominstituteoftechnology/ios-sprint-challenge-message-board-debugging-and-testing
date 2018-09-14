//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
	var app:XCUIApplication!

    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
		// ...no
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }

	func testSendingMessage()
	{
		// navigate to new message screen
		app.tables["Threads.table"].cells["Threads.cell0"].tap()
		app.navigationBars.buttons["Messages.newMessage"].tap()

		// verify
		NewMessagePage(testCase: self).verifyMessageSend(file: #file, line: #line)
	}

	func testCreatingThread()
	{
		ThreadTablePage(testCase:self).verifyThreadCreation(file: #file, line: #line)
	}

	func testSegueToMessageView()
	{
		let ttp = ThreadTablePage(testCase:self)
		let cellLabel = ttp.cellLabelAt(0).label
		ttp.cellAt(0).tap()

		self.expect(exists: app.navigationBars["Messages.navBar"])
		self.expect(exists: app.navigationBars["Messages.navBar"].staticTexts[cellLabel])
	}
    
}
