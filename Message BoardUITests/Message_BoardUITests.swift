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
    
      func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

func testCreateThread() {
    try! setUpWithError()

    let createANewThreadTextField = XCUIApplication().tables.textFields["Create a new thread:"]
    createANewThreadTextField.tap()


        createANewThreadTextField.typeText("Test New Thread 3")
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.tables.cells.staticTexts["Test New Thread 3"].exists)
    }



        func testCreateMessage() {
            try! setUpWithError()

            let app = XCUIApplication()
            app.otherElements.statusBars.children(matching: .other).element.children(matching: .other).element.tap()
            
            let tablesQuery2 = app.tables
            tablesQuery2.textFields["Create a new thread:"].tap()
            
            let tablesQuery = tablesQuery2
            tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Test New Thread"]/*[[".cells.staticTexts[\"Test New Thread\"]",".staticTexts[\"Test New Thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
            
            let test4StaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["test 4"]/*[[".cells.staticTexts[\"test 4\"]",".staticTexts[\"test 4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            test4StaticText.tap()
            
            let test4NavigationBar = app.navigationBars["test 4"]
            test4NavigationBar.buttons["Add"].tap()
            
            let enterYourNameTextField = app.textFields["Enter your name:"]

             XCTAssert(enterYourNameTextField.isHittable)
             enterYourNameTextField.tap()
             enterYourNameTextField.typeText("Ian")
            
            let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
            textView.tap()
            textView.tap()
            app.navigationBars["New Message"].buttons["Send"].tap()
            test4NavigationBar.buttons["λ Message Board"].tap()

            test4StaticText.tap()
            tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Dang it"]/*[[".cells.staticTexts[\"Dang it\"]",".staticTexts[\"Dang it\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            let detailTable = app.tables.matching(identifier: "MessageThreadDetailTableViewController")
            let message = detailTable.cells.staticTexts["Ian"]

            XCTAssertEqual(message.label, "Ian")
    }

    func testCancel(){
     try! setUpWithError()

        let app = XCUIApplication()
        let testNewThreadStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Test New Thread"]/*[[".cells.staticTexts[\"Test New Thread\"]",".staticTexts[\"Test New Thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        testNewThreadStaticText.tap()
        
        let testNewThreadNavigationBar = app.navigationBars["Test New Thread"]
        testNewThreadNavigationBar.buttons["Add"].tap()

        app.navigationBars["New Message"].buttons["Cancel"].tap()
        
        let messageBoardButton = testNewThreadNavigationBar.buttons["λ Message Board"]
        messageBoardButton.tap()
        testNewThreadStaticText.tap()
        app.tables["Empty list"].tap()

        messageBoardButton.tap()


    }





        }

