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
    func testAddingNewThread() {
        
       
        
    }
    
    func testAddingNewMessage() {
        
    }
    
    func testSendButton() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["New People"]/*[[".cells.staticTexts[\"New People\"]",".staticTexts[\"New People\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["New People"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //Assert that it saved the new message Anna
        
    }
    
    func testBackToTaleVCButton() {
        
    }
    
}
