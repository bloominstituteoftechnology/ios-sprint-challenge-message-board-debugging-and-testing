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
    
    
        func testSegueProblem() {
        
            let emptyListTable = XCUIApplication().tables["Empty list"]
            emptyListTable/*@START_MENU_TOKEN@*/.textFields["Create a new thread:"]/*[[".textFields[\"Create a new thread:\"]",".textFields[\"createthreadfield\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
            emptyListTable.tap()
        
            let cellCount = emptyListTable.cells.count
            
            XCTAssert(cellCount > 0)
    }
    
}
