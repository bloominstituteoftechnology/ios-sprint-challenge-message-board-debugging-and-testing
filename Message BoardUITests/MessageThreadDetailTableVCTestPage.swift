//
//  MessageThreadDetailTableVCTestPage.swift
//  Message BoardUITests
//
//  Created by Yvette Zhukovsky on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageThreadDetailTableVCTestPage: TestPage {
    var testCase: XCTestCase
    
    //Elements
    private var backButton: XCUIElement {
        return app.navigationBars.buttons.firstMatch
    }
    
    private var addMessageButton: XCUIElement {
       return app.buttons["Add"]
    }
    
    private func cell(_ title: String) -> XCUIElement {
        return app.staticTexts[title]
    }
    
    //Actions
    
    @discardableResult func goBack() -> MessageThreadTViewControllerTestPage {
        backButton.tap()
        return MessageThreadTViewControllerTestPage(testCase: testCase)
    }
    
    @discardableResult func tapAddButton() -> MessagBoardDetailViewControllerTest {
        addMessageButton.tap()
        return MessagBoardDetailViewControllerTest(testCase: testCase)
    }
    
    //Verifications
//
//    @discardableResult func cellIsthere()-> MessageThreadDetailTableVCTestPage {
//
//     XCTAssert(cell.exists)
//        return self
//    }
    
    @discardableResult func titleShows(_ title: String)-> MessageThreadDetailTableVCTestPage {

        let navigationBar = app.navigationBars.firstMatch
        XCTAssert(navigationBar.exists)
        return self
    }
    
    
}
