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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTapOnThreadCell(){

        ThreadPage(testCase: self)
            .tapOnThreadsCell(at: 0)


    }

    func testAddNewThread(){

        ThreadPage(testCase: self)
            .tapAndEnterTextOnThreadTitleTextField(with: "Hello")
            .tapOnThreadsCell(at: 0)

    }

    func testThreadsHaveLoaded(){

        MessagePage(testCase: self)
            .verifyMessagesHaveLoaded()

    }

    func testMessagesHaveLoaded(){

        MessagePage(testCase: self)
            .verifyMessagesHaveLoaded()

    }

    func testPopAfterMessageSend(){

        MessagePage(testCase: self)
//            .tapAndEnterTextOnThreadTitleTextField(with: "Hello")

    }

    func testRequiredSenderAlert(){

        MessagePage(testCase: self)
        //            .tapAndEnterTextOnThreadTitleTextField(with: "Hello")

    }

    func testAddNewMessage(){

        MessagePage(testCase: self)
        //            .tapAndEnterTextOnThreadTitleTextField(with: "Hello")

    }

    func testSendButton(){

        MessagePage(testCase: self)
//            .tapAndEnterTextOnThreadTitleTextField(with: "Hello")

    }
    
}
