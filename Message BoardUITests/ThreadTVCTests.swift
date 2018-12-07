//
//  ThreadTVCTests.swift
//  Message BoardUITests
//
//  Created by Nikita Thomas on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class ThreadTVCTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {

    }

    func testCreateThread() {
        ThreadTVCPage(testCase: self)
        .createNewThread()
            
        .verifyThreadCell(at: 0)
    }

}
