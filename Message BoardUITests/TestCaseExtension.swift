//
//  TestCaseExtension.swift
//  Message BoardUITests
//
//  Created by Jocelyn Stuart on 3/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    func expect(exists element: XCUIElement, file: String = #file, line: UInt = #line) {
        if !element.exists {
            recordFailure(withDescription: "Expected \(element) to exist.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
}
