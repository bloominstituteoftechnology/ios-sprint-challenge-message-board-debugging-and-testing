//
//  Message_BoardUITests2.swift
//  Message BoardUITests2
//
//  Created by Norlan Tibanear on 9/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests2: XCTestCase {

   

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
                
                
                
                let app = XCUIApplication()
                app.tables/*@START_MENU_TOKEN@*/.staticTexts["New Thread"]/*[[".cells.staticTexts[\"New Thread\"]",".staticTexts[\"New Thread\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
                let newThreadNavigationBar = app.navigationBars["New Thread"]
                newThreadNavigationBar.buttons["Add"].tap()
                
                let newmessagetitletextfieldTextField = app/*@START_MENU_TOKEN@*/.textFields["newMessageTitleTextfield"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"newMessageTitleTextfield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                newmessagetitletextfieldTextField.tap()
                newmessagetitletextfieldTextField.tap()
                
                let newmessagetextviewTextView = app.textViews["newMessageTextView"]
                newmessagetextviewTextView.tap()
                newmessagetextviewTextView.tap()
                app.navigationBars["New Message"].buttons["Send"].tap()
                newThreadNavigationBar.buttons["λ Message Board"].tap()
                
                
                                
            }
        }
    }
}
