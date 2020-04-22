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
    
    // TO TEST:
    // -- can view threads
    // -- can tap and create new thread
    // -- can navigate to new thread
    // -- can view messages
    //
    // -- can create new message in thread
    
    func testCanCreateAndViewThreads(){
        
        for i in 0...20{
            let _ = ThreadPage(testCase: self)
                .createThread(with: "TEST THREAD #\(i)")
        }
        
        let _ = ThreadPage(testCase: self)
        .tryScroll()
        
        // Tap on last thread
        .verifyThreadDisplayedInCells()
        
    }
    
    func testCreatingNewMessageInThread(){
        
        let _ = ThreadPage(testCase: self)
            .createThread(with: "TEST THREAD")
        
            .tapOnFirstVisibleCell()
        
        let _ = MessagePage(testCase: self)
        .goToNewMessageScreen().createMessage(with: "TestMessage", content: "Message").sendMessage()
        
    
        let _ = MessagePage(testCase: self)
        .verifyMessagesDisplayedInCells()
        
        
    }
    
    
    

}
