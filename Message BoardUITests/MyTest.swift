//
//  MyTest.swift
//  Message BoardUITests
//
//  Created by Lotanna Igwe-Odunze on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

protocol MyTests {
    var testCase: XCTestCase { get }
}
extension MyTests {
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
