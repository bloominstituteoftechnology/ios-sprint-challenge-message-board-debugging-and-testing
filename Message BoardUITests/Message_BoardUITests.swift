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
    
    func testAddNewMessage() {

        XCTAssertTrue(tappedCell.exists)
        tappedCell.tap()
        
        XCTAssertTrue(addButton.exists)
        addButton.tap()
        
        XCTAssertTrue(nameTextField.exists)
        nameTextField.tap()
        nameTextField.typeText("Jerry")
        app.buttons["return"].tap()
        
        XCTAssertTrue(newMessageTextView.exists)
        newMessageTextView.tap()
        newMessageTextView.typeText("Howdy")
        app.buttons["return"].tap()
        
        XCTAssertTrue(sendButton.exists)
        sendButton.tap()
        
    }
    
    func testFunc() {
        mBTextField.tap()
        mBTextField.typeText("hello, world")
        app.buttons["return"].tap()
    }
    
    func testExpectation() {
        let didFinish = expectation(description: "didFinish")
        var name = ""
        let url = URL(string: "https://apple.com")!

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            didFinish.fulfill()
            name = "Dave"
        }.resume()

        wait(for: [didFinish], timeout: 5) // blocking sync wait

        // Assertion only happens after the time out, or web request completes
        XCTAssertEqual("Dave", name)
    }
    
    func segues(ofViewController viewController: UIViewController) -> [String] {
        let identifiers = (viewController.value(forKey: "storyboardSegueTemplates") as? [AnyObject])?.compactMap({ $0.value(forKey: "identifier") as? String }) ?? []
        return identifiers
    }
    
    private var nameTextField: XCUIElement {
        return app.textFields["nameTextField"]
    }
    
    private var newMessageTextView: XCUIElement {
        return app.textViews["newMessageTextView"]
    }
    
    private var tappedCell: XCUIElement {
        return app.cells["messageThreadCell"]
    }
    
    private var sendButton: XCUIElement {
        return app.buttons["send"]
    }
    
    private var mBTextField: XCUIElement {
        return app.textFields["newThreadTextField"]
    }
    
    private var addButton: XCUIElement {
        return app.buttons["Add"]
    }
}
