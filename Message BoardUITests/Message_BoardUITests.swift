//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    //MARK: Properties
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    //MARK: SetUp Function
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    //MARK: UITests
    func testSearchingNewThread() {
        
    }
    
    func testAddingNewMessage() {
        
    }
    
    func testSaveButton() {
        
    }
    
    func testBackToTaleVCButton() {
        
    }
    
}
