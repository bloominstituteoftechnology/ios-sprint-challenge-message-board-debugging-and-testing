//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
//    func testNewMessage() {
//        
//        app.launch()
//        
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Michael Cookies"]/*[[".cells.staticTexts[\"Michael Cookies\"]",".staticTexts[\"Michael Cookies\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        
//        let michaelCookiesNavigationBar = app.navigationBars["Michael Cookies"]
//        michaelCookiesNavigationBar.buttons["Add"].tap()
//        app/*@START_MENU_TOKEN@*/.textFields["newMessageTitleTextfield"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"newMessageTitleTextfield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        
//        let newmessagetextviewTextView = app.textViews["newMessageTextView"]
//        newmessagetextviewTextView.tap()
//        newmessagetextviewTextView.tap()
//        app.navigationBars["New Message"].buttons["Send"].tap()
//        michaelCookiesNavigationBar.buttons["λ Message Board"].tap()
//        
//    }
    
    

    
    func testCancelMessage() {
     try! setUpWithError()
     
     app.tables.staticTexts["A New Thread"].tap()
     let NavigationBar = app.navigationBars["A New Thread"]
     let StaticText = NavigationBar.staticTexts["A New Thread"]
     StaticText.tap()
     NavigationBar.buttons["Add"].tap()
     app.navigationBars["New Message"].buttons["Cancel"].tap()
     StaticText.tap()
     XCTAssertEqual(StaticText.label, "A New Thread")
      
    }

    
    
    
}//
