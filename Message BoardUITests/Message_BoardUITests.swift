//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    // MARK: - MessageThreadsTableViewController Tests
    
    // add a new message thread
    func testCreateNewMessageThread() {
        // create the thread
        
        // test that cell exists
    }
    
    // tapping on a message thread cell
    func testTappingOnMessageThreadCell() {
        // create thread #1
        
        // test title
        
        // test cell exists
        
        // tap on cell
        
        // test cell title matches thread title
        
        // test back button
        
        // test create new thread #2
        
        // test cell exists
        
        // tap on it
        
        // test title matches thread title again
        
    }
    

    // MARK: - MessageThreadDetailTableViewController Tests
    
    // add a new message to thread
    func testAddNewMessageToThread() {
        // tap on existing cell **YAY persistence**
        
        // does title still match
        
        // does add button exist
        
        // tap on it
        
        // test title
        
        // test text field exists
        
        // test text view exists
        
        // test abort without send
        
        // test input textfield
        
        // test input textview
        
        // test send button
        
        // test send without input?
        
        
    }
    
    
    
}
