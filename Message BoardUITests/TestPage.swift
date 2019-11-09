//
//  TestPage.swift
//  Message BoardUITests
//
//  Created by Madison Waters on 2/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

protocol  TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    
}
