//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

	var threadTableView: XCUIElement {
		let table = app.tables["messageThreadstableviewcontroller.tableview"]
		XCTAssertTrue(table.exists)
		return table
	}

	var messageTableView: XCUIElement {
		let table = app.tables["messageThreaddetailtableviewcontroller.tableview"]
		XCTAssertTrue(table.exists)
		return table
	}

	var cell: XCUIElement {
		let tableCell = threadTableView.cells.firstMatch
		XCTAssertTrue(tableCell.exists)
		return tableCell
	}

	func testTappingOnCellSeguesToMessageTableView() {
		XCTAssertTrue(cell.isHittable)
		cell.tap()
	}

	func testCanTapTableViewCell() {
		cell.tap()
		XCTAssertTrue(cell.isHittable)
		let addButton = app.buttons["Add"]
		XCTAssertTrue(addButton.exists)
		XCTAssertTrue(addButton.isEnabled)
	}
    
}
