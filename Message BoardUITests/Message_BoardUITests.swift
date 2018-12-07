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
    
   
    func makingNewThreads() {
   let title1 = "Brand New Message"
    MessageThreadTViewControllerTestPage(testCase: self)
        .NavigationTitle()
        .createNewThread(title1)
        .verifyingCell(title1)
        .tapOnCell(at:1)
    }
    
    func tappingOnThread() {
       let title1 = "Brand New Message"
        MessageThreadDetailTableVCTestPage(testCase: self)
            .titleShows(title1)
            .cellIsthere(title1)
            .goBack()
            .tapOnCell(at: 1)
            .tapAddButton()
        
    }
    
    
    
    
    
    
    
}
