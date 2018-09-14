import Foundation
import XCTest

protocol TestPage
{
	var testCase:XCTestCase { get }
}

extension TestPage
{
	var app:XCUIApplication {
		return XCUIApplication()
	}
}

