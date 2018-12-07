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
            let title2 = "Yvette"
        let message = "Message in the bottle!!"
        
           MessageThreadTViewControllerTestPage(testCase: self)
            .verifyingCell(title1)
            .tapOnCell(at: 1)
            .tapAddButton()
            .showTitle()
            .createNewThread(title2)
            .writeMessage(message)
            .tapSendButton()
            .goBack()
            .NavigationTitle()

    }
  
    
    
    
    
    
    
}
