//
//  MessagBoardDetailViewControllerTest.swift
//  Message BoardUITests
//
//  Created by Yvette Zhukovsky on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct  MessagBoardDetailViewControllerTest: TestPage {
    var testCase: XCTestCase
    
    //Elements
    
    private var newThreadAdding: XCUIElement {
   return app.textFields["MessageDetailViewController.NewMessageName"]
        
    }
    
    private var backButton: XCUIElement {
        return app.navigationBars.buttons.firstMatch
    }
    
      private var messageView: XCUIElement {
   return app.textViews["MessageDetailViewController.NewMessageView"]
    }
    
    
    private func cell(_ title: String) -> XCUIElement {
        return app.staticTexts[title]
    }
    
    private var sendButton: XCUIElement {
         return app.navigationBars.element(boundBy: 0).buttons["Send"]
    }
    
    //Actions
    
    @discardableResult func createNewThread(_ title: String) -> MessagBoardDetailViewControllerTest {
        newThreadAdding.tap()
        newThreadAdding.typeText(title)
        newThreadAdding.typeText("\n")
        return self
    }
    
    
    @discardableResult func tapSendButton()->MessageThreadDetailTableVCTestPage {
        sendButton.tap()
        return MessageThreadDetailTableVCTestPage(testCase: testCase)
        
    }
    
    @discardableResult func goBack() -> MessageThreadDetailTableVCTestPage{
        backButton.tap()
        return MessageThreadDetailTableVCTestPage(testCase: testCase)
    }
    
    
     @discardableResult func writeMessage(_ message: String) -> MessagBoardDetailViewControllerTest {
       messageView.tap()
        messageView.typeText(message)
        messageView.typeText("\n")
        return self
        
        
    }

    
    //Verifications
    
    @discardableResult func showTitle() -> MessagBoardDetailViewControllerTest{
        let navigationBar = app.navigationBars.firstMatch
        XCTAssert(navigationBar.exists)
        return self
        
    }
    
}
