//
//  MessagesPage.swift
//  Message BoardUITests
//
//  Created by Vuk Radosavljevic on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessagesPage: TestPage {
    
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    var searchBar: XCUIElement {
        return app.tables["Empty list"].textFields["Create a new thread:"]
    }
    
    var helloMessage: XCUIElement {
        return app.tables.staticTexts["Hello"]
    }
    
    
    // MARK: - Actions
    
    @discardableResult func tapOnSearchBar(file: String = #file, line: UInt = #line) -> MessagesPage {
        let search = searchBar
        search.tap()
        return self
    }
    
    @discardableResult func typeInSearchBar(_ text: String, file: String = #file, line: UInt = #line) -> MessagesPage {
        let search = searchBar
        search.typeText(text)
        return self
    }
    
    // MARK: - Verifications
    @discardableResult func verifyHelloIsThere(file: String = #file, line: UInt = #line) -> MessagesPage {
        let hello = helloMessage
        hello.tap()
        return self
    }
    
    
    
}
