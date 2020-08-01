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

    func launch() -> XCUIApplication {
          // UI tests must launch the application that they test.
          let app = XCUIApplication()
          app.launch()
          return app
      }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testDetailTableViewPassesThread() {
        let app = launch()

        app.tables.children(matching: .cell).matching(identifier: "MessageThreadCell").element(boundBy: 0)/*@START_MENU_TOKEN@*/.staticTexts["MessageThreadTitle"]/*[[".staticTexts[\"New Thread\"]",".staticTexts[\"MessageThreadTitle\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func testDetailSendButton() {
        let app = launch()


    }

}
