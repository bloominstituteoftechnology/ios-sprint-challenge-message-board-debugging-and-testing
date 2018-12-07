//
//  DetailVCPage.swift
//  Message BoardUITests
//
//  Created by Nikita Thomas on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct DetailVCPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    
    
    
    // Interactions
    
    @discardableResult func tapBackButton() -> ThreadTVCPage {
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        backButton.tap()
        return ThreadTVCPage(testCase: testCase)
    }
    
    
    // Verification
    
    
    
}
