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
    
    func testNewMessageSend() {
        
        app.tables["Empty list"].textFields["Create a new thread:"].tap()
        
        app.keys["h"].tap()
        app.keys["e"].tap()
        app.keys["y"].tap()
        
        app.buttons["Return"].tap()
        app.tables.cells.staticTexts["hey"].tap()
        app.navigationBars["hey"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()

        app.keys["c"].tap()
        app.keys["h"].tap()
        app.keys["a"].tap()
        app.keys["d"].tap()
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        
        app.keys["H"].tap()
        app.keys["e"].tap()
        app.keys["y"].tap()
        
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        
    }
    
//    // Test asynchronous logic using an expectation
//    func testExpectation() {
//        let didFinish = expectation(description: "didFinish")
//        var name = ""
//        let url = URL(string: "https://apple.com")!
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            didFinish.fulfill()
//            name = "Dave"
//        }.resume()
//
//        wait(for: [didFinish], timeout: 5) // blocking sync wait
//
//        // Assertion only happens after the time out, or web request completes
//        XCTAssertEqual("Dave", name)
//    }
}
