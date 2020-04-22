//
//  MessageDetailViewUITest.swift
//  Message BoardUITests
//
//  Created by Scott Bennett on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class MessageDetailViewUITest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        app.navigationBars["test 3"].buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()
        
    }

}
