//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//
import Foundation
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
    
    func testCreatingNewThread() {
        ThreadsTableViewControllerPage(testCase: self)
        .addNewThread()
            .verifyThreadExists(at: 0)
    }
    
    func testMockMessageThreadsLoaded() {
        ThreadsTableViewControllerPage(testCase: self)
            .verifyThread(at: 0)
            .verifyThread(at: 1)
    }
    
    func testCreatingNewMessageOnExistingThread() {
        ThreadsTableViewControllerPage(testCase: self)
        .seeThread(at: 0)
        .clickAddButton()
        .writeMessage(from: "Me", with: "Test")
        .clickSendButton()
        .verifyMessageExists(at: 1)
    }
    
    
}
