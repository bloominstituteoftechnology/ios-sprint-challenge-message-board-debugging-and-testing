//
//  MessagBoard-DetailViewControllerTest.swift
//  Message BoardUITests
//
//  Created by Yvette Zhukovsky on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct  MessagBoardDetailViewControllerTest: TestPage {
    var testCase: XCTestCase
    
    //Elements
    
    private var newThreadTextField: XCUIElement {
   return app.textFields["MessageDetailViewController.NewMessageName"]
    }
    
    private func cell(_ title: String) -> XCUIElement {
        return app.staticTexts[title]
    }
    
    //Actions
    
    
    
    
    
    //Verifications
    
    
}
