//
//  MessageThreadTVCTests.swift
//  Message BoardUITests
//
//  Created by Jerrick Warren on 12/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class MessageThreadTVCTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()

    }

    override func tearDown() {
        
    }

    func testCreateNewThread() {
        ThreadTVCPage(testCase: self)
        .createNewThread()
        .verifyCell(at: 0)
    }

    func testFetchServer(){
        ThreadTVCPage(testCase: self)
            .verifyCell(at: 0)
            .tapAddButton()
            .sendNewMessage()
    }
    
   
    
}
