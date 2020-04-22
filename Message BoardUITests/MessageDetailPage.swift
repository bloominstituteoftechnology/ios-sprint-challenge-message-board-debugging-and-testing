//
//  MessageDetailPage.swift
//  Message BoardUITests
//
//  Created by Carolyn Lea on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageDetailPage: TestPage
{
    let testCase: XCTestCase
    
    var sendButton: XCUIElement
    {
        return app.navigationBars.element(boundBy: 0).buttons["Add"]
    }
    
    var textField: XCUIElement
    {
        return app.textFields.element(boundBy: 0)
    }
    
    var textView: XCUIElement
    {
        return app.textViews.element(boundBy: 0)
    }
    
    @discardableResult func typeName(with name: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        textField.tap()
        textField.typeText(name)
        return self
    }
    
    @discardableResult func typeMessage(with message: String, file: String = #file, line: UInt = #line) -> MessageDetailPage {
        textField.tap()
        textField.typeText(message)
        return self
    }
}
