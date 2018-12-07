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
    
//    func testMakingNewThread() {
//        let title1 = "Test Thread"
//        let title2 = "Second Test Thread"
//        MessageThreadTVCTestPage(testCase: self)
//            .createNewThread(title1)
//            .cellExists(title1)
//            .createNewThread(title2)
//            .cellExists(title2)
//    }
    
    
    
}



protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
