//
//  XCTestCase+Expect.swift
//  Message BoardUITests
//
//  Created by Victor  on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

extension XCTestCase {
    // MARK: - Equals
    
    func expect(nil expression: @autoclosure () -> Any?, file: String = #file, line: UInt = #line) {
        if let it = expression() {
            recordFailure(withDescription: "Expected '\(it)' to be nil.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(notNil expression: @autoclosure () -> Any?, file: String = #file, line: UInt = #line) {
        if expression() == nil {
            recordFailure(withDescription: "Expected this not to be nil.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(exists element: XCUIElement, file: String = #file, line: UInt = #line) {
        if !element.exists {
            recordFailure(withDescription: "Expected \(element) to exist.", inFile: file, atLine: Int(line), expected: true)
        }
    }
}
