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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTapOnThreadCell(){

        ThreadPage(testCase: self)
            .verifyThreadCellExists(at: 0)
            .tapOnThreadsCell(at: 0)


    }

    func testAddNewThread(){

        ThreadPage(testCase: self)
            .tapAndEnterTextOnThreadTitleTextField(with: "Hello")
            .verifyThreadCellExists(at: 2)
            .tapOnThreadsCell(at: 2)
        MessagePage(testCase: self)
            .verifyMessagesCount(count: 0)

    }

    func testThreadsHaveLoaded(){

        ThreadPage(testCase: self)
            .verifyThreadsHaveLoaded()

    }

    func testMessagesHaveLoaded(){
        
        ThreadPage(testCase: self)
            .verifyThreadCellExists(at: 0)
            .tapOnThreadsCell(at: 0)
        MessagePage(testCase: self)
            .verifyMessagesHaveLoaded()

    }

    func testEnterNewMessageAndSend(){

        ThreadPage(testCase: self)
            .tapOnThreadsCell(at: 0)
        MessagePage(testCase: self)
            .tapOnAddButton()
        MessageDetailPage(testCase: self)
            .enterTextIntoSenderTextField(sender: "Ben")
            .enterTextIntoMessageTextView(text: "Sample Text")
            .tapSendButtonSuccess()
            .verifyMessagesWithSenderTitleExists(with: "Ben")

    }

    func testNoSenderAlert(){

        ThreadPage(testCase: self)
            .tapOnThreadsCell(at: 0)
        MessagePage(testCase: self)
            .tapOnAddButton()
        MessageDetailPage(testCase: self)
            .tapSendButtonFail()
            .verifyAlertExists()
            .tapAlertOkay()

    }
    
    func testGettingRightSegueToDetail(){
        
        ThreadPage(testCase: self)
            .tapOnThreadsCell(at: 0)
        MessagePage(testCase: self)
            .tapOnAddButton()

    }
    
    func testNoDuplicationOfThreads() {
        ThreadPage(testCase: self)
            .tapAndEnterTextOnThreadTitleTextField(with: "Hello")
            .tapOnThreadsCell(at: 2)
        MessagePage(testCase: self)
            .goBackToThreadCell(with: "Hello")
            .verifyThreadsCount()
        
    }
}
