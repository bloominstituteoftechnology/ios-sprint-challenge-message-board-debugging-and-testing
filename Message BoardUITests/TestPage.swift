//
//  TestPage.swift
//  Message BoardUITests
//
//  Created by Lotanna Igwe-Odunze on 2/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
