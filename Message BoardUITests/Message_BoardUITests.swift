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
    func testSeguetoDetailTableVC() {
        tappedANewThread()
        sleep(2)
    }
    func testCreateANewThread() {
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.textFields["Create A New Thread"]/*[[".textFields[\"Create a new thread:\"]",".textFields[\"Create A New Thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.twoFingerTap()
        
    }
    func test() {
        
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["A New Thread"]/*[[".cells.matching(identifier: \"A New Thread\").staticTexts[\"A New Thread\"]",".staticTexts[\"A New Thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.twoFingerTap()
        app.navigationBars["Title"].buttons["Add"].twoFingerTap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.twoFingerTap()
        
        
        
    }
    
    func testSegueToDetailVC() {
        tappedANewThread()
        tapAddButton()
        sleep(2)
    }
    
    func testSendingMessage() {
        tappedANewThread()
        tapAddButton()
        tapMessageTextView()
        
    }
    
    
    
    // Mark: Functions
    
    func createANewThread() {
        XCUIApplication().tables.textFields["Create a new thread:"].twoFingerTap()
    }
    
    func tapAddButton() {
        app.navigationBars["Title"].buttons["Add"].twoFingerTap()
    }
    func tappedANewThread() {
         app.tables/*@START_MENU_TOKEN@*/.staticTexts["A New Thread"]/*[[".cells.matching(identifier: \"A New Thread\").staticTexts[\"A New Thread\"]",".staticTexts[\"A New Thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.twoFingerTap()
    }
    
    
    func tapMessageTextView() {
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.twoFingerTap()
    }
    
}
