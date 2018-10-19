//
//  MessageThreadDetailTableViewPage.swift
//  Message BoardUITests
//
//  Created by Madison Waters on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct MessageThreadDetailTableViewPage: TestPage {
 //MessageThreadDetailTableView
    
    // UI Elements
    var messageThreadDetailTableViewController: XCUIElement {
        return app.tableRows["MessageThreadDetailTableView"]
    }
    
    @discardableResult func messageThreadDetailTableViewCell(at index: Int) -> XCUIElement {
        return messageThreadDetailTableViewController.cells.element(boundBy: index)
    }
    
// Title
// 2 nav bar buttons
// MessageThreadDetailTableViewController.Cell
    
    // (Inter)Actions
    
    // Verifications
    
    func testMessageToDetailMessageView() {
        let app = XCUIApplication()

        XCTAssertTrue(app.tableRows["MessageThreadDetailTableView"].exists)
        
        app.cells.element(boundBy: 1).tap()
        
        XCTAssertFalse(app.tableRows["MessageThreadDetailTableView"].exists)
        XCTAssertTrue(app.tableRows["MessageDetailView"].exists)
        
        //app.messagesButton().tap()
    }
    
//    func testShowsNotesDetails() {
//        // From the notes list screen
//        let app = XCUIApplication()
//
//        XCTAssertTrue(app.anyViewWithIdentifier("notes_list_screen").exists)
//
//        // When tapping on a note
//        app.cells.elementBoundByIndex(1).tap()
//
//        // It goes to the note details screen
//        XCTAssertFalse(app.anyViewWithIdentifier("notes_list_screen").exists)
//        XCTAssertTrue(app.anyViewWithIdentifier("note_screen").exists)
//
//        // Go back
//        app.backButton().tap()
//    }
    
    var testCase: XCTestCase
}
