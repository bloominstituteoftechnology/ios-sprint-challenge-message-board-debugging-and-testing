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
		app.cells["Thread.cell0"].tap()
		app.cells["Messages.newMessage"].tap()

		// verify
		NewMessagePage(testCase: self).verifyMessageSend(file: #file, line: #line)
	}
    
}
