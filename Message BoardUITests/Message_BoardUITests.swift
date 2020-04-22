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
    
    func testCreatingMessageThread(){
        MessageThreadsPage(testCase: self)
            .createMessageThread("New Message Thread")
            .verifyMessageThread(title: "New Message Thread")
            .createMessageThread("This is another Message Thread")
            .verifyMessageThread(title: "This is another Message Thread")
            .createMessageThread("This is another another Message Thread")
            .verifyMessageThread(title: "This is another another Message Thread")
    }
    
    func testCreatingMessage(){
        MessageThreadsPage(testCase: self)
            .createMessageThread("New Message Thread")
            .tapMessageThread()
            .tapAddBarButton()
            .fillMessage(name: "Moin", message: "This is a new message")
            .verifyMessage(message: "This is a new message")
            .tapAddBarButton()
            .fillMessage(name: "Moin", message: "This is a newer message")
            .verifyMessage(message: "This is a newer message")
    }
    
}
