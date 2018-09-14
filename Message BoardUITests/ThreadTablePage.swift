//
//  ThreadTablePage.swift
//  Message BoardUITests
//
//  Created by William Bundy on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct ThreadTablePage: TestPage
{
	var testCase:XCTestCase

	var table:XCUIElement {
		return app.tables["Threads.table"]
	}

	func cellAt(_ index:Int) -> XCUIElement {
		return table.cells["Threads.cell\(index)"]
	}

	func cellLabelAt(_ index:Int) -> XCUIElement {
		return cellAt(index).staticTexts["Threads.cell\(index).text"]
	}

	var newThread:XCUIElement {
		return app.textFields["Threads.newThread"]
	}

	@discardableResult
	func verifyThreadCreation(file:String, line:UInt) -> ThreadTablePage
	{
		testCase.expect(exists: newThread, file:file, line:line)
		newThread.tap()
		newThread.typeText("This is a new test thread\n")
		//newThread.return
		let lastCell = table.cells.count - 1
		testCase.expect(exists: cellAt(lastCell), file:file, line:line)
		testCase.expect(exists: cellLabelAt(lastCell), file:file, line:line)
		testCase.expect(cellLabelAt(lastCell).label, equals: "This is a new test thread")
		return self
	}
}
