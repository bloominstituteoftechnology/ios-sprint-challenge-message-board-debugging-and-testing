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
    func testCreateNewThread() {
        
        let newThread = XCUIApplication().tables["Empty list"].textFields["com.messageboard.createboard"]
            newThread.tap()
        
        newThread.typeText("New Thread\n")
        
        XCTAssert(app.staticTexts["New Thread"].exists)
        
    }
}
