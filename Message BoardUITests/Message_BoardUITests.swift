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
 
    func testmakingNewThreads() {
        let title1 = "Brand New Message"
        MessageThreadTViewControllerTestPage(testCase: self)
        .NavigationTitle()
        .createNewThread(title1)
        .verifyingCell(title1)
        .tapOnCell(at:1)
    }
    
    func testtappingOnThread() {
            let title1 = "Brand New Message"
           MessageThreadTViewControllerTestPage(testCase: self)
            .tapOnCell(at: 1)
            .tapAddButton()
            .goBack()
            .titleShows(title1)
    
    }
  
     func testaddindNewMessage() {
        let title1 = "Brand New Message More"
        let message = "Hello There!!!"
        MessageThreadTViewControllerTestPage(testCase: self)
        .createNewThread(title1)
        .writeMessage(message)
        .showTitle()
        .tapSendButton()
        .goBack()
    }
    
    
    
    
    
}
