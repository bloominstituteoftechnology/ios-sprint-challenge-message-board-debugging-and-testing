//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Tests
    
    // Test asynchronous logic using an expectation
    func testExpectation() {
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://apple.com")!

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "Beth"
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        XCTAssertEqual("Beth", name)
    }
    
    func testCreateThrd() {
        let searchTF = app.textFields["Create a new thread:"]
        searchTF.tap()
        
        searchTF.typeText("Testing 000 Thread")
        app.keyboards.buttons["return"].tap()
        
        let newThread = app.staticTexts["Testing 000 Thread"]
        XCTAssert(newThread.exists)
        newThread.tap()
        
        let backBtn = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssert(backBtn.exists)
        backBtn.tap()
    }
    
    func testCreateMsge() { // error will try to fix later 
        let searchTF = app.textFields["Create a new thread:"]
         searchTF.tap()

         searchTF.typeText("Testing 000 Thread")
         app.keyboards.buttons["Return"].tap()

         let newThread = app.staticTexts["Testing 000 Thread"]
         newThread.tap()

         let composeBtn = app.buttons["Add"]
         composeBtn.tap()

         let enterNameTF = app.textFields["Enter your name:"]
         enterNameTF.tap()
         enterNameTF.typeText("Elizabeth")

         let enterMsgTV = app.textViews.element(boundBy: 0)
         enterMsgTV.tap()
         enterMsgTV.typeText("This is a test")

         let sendBtn = app.buttons["Send"]
         XCTAssert(sendBtn.exists)
         sendBtn.tap()

         let newMsg = app.tables.cells.staticTexts["Elizabeth"]
         XCTAssert(newMsg.exists)
         newMsg.tap()
    }
}

extension XCTestCase {

    func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
        let keyboard = XCUIApplication().keyboards.element
        while (true) {
            element.tap()
            if keyboard.exists {
                break;
            }
            RunLoop.current.run(until: NSDate(timeIntervalSinceNow: 0.5) as Date)
        }
    }
}
