//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    let newThread = "A New Thread"
    let testingAgain = "Testing again"
    let messageBoard = "λ Message Board"
    let newMessage = "New Message"
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testMakingNewThread() {
        let title1 = "Test Thread"
        let title2 = "Second Test Thread"
        MessageThreadTestPage(testCase: self)
            .createNewThread(title1)
            .cellExists(title1)
            .createNewThread(title2)
            .cellExists(title2)
    }
    
    func testTapThread() {
        MessageThreadTestPage(testCase: self)
            .createNewThread(newThread)
            .tapCell(newThread)
        
    }
    
    func testTappingOnThread() {
        MessageThreadTestPage(testCase: self)
            .titleDisplays(messageBoard)
            .createNewThread(newThread)
            .cellExists(newThread)
            .createNewThread(testingAgain)
            .cellExists(testingAgain)
            .tapCell(newThread)
    }
    
    func testAddingNewMessage() {
        MessageThreadTestPage(testCase: self)
            .createNewThread(newThread)
            .tapCell(newThread)
            .titleDisplays(newThread)
            .tapAddButton()
            .writeName("Sean")
            .writeMessage("This is a test message.")
            .tapSendButton()
            .numberOfCellsIs(1)
    }
    
    func testNotAddingNewMessage() {
        MessageThreadTestPage(testCase: self)
            .createNewThread(newThread)
            .tapCell(newThread)
            .titleDisplays(newThread)
            .numberOfCellsIs(0)
            .tapAddButton()
            .titleDisplays(newMessage)
            .writeName("Sean")
            .writeMessage("This is a test message.")
            .tapBackButton()
            .titleDisplays(newThread)
            .numberOfCellsIs(0)
            .tapBackButton()
            .titleDisplays(messageBoard)
    }
}








protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}








extension XCTestCase {
    
    // MARK: - Throws
    func shouldNotThrow(file: String = #file, line: UInt = #line, _ block: () throws -> Void) {
        do {
            _ = try block()
        } catch {
            recordFailure(withDescription: "Boo! \(error)", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func shouldThrow(file: String = #file, line: UInt = #line, _ block: () throws -> Void) {
        do {
            _ = try block()
            recordFailure(withDescription: "Should have thrown!", inFile: file, atLine: Int(line), expected: true)
        } catch {
        }
    }
    
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
    
    func expect(doesNotExist element: XCUIElement, file: String = #file, line: UInt = #line) {
        if element.exists {
            recordFailure(withDescription: "Expected \(element) to not exist.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(false expression: @autoclosure () -> Bool?, file: String = #file, line: UInt = #line) {
        guard let actual = expression() else {
            recordFailure(withDescription: "Expected 'nil' to be false.", inFile: file, atLine: Int(line), expected: true)
            return
        }
        if actual != false {
            recordFailure(withDescription: "Expected this to be false.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(true expression: @autoclosure () -> Bool?, file: String = #file, line: UInt = #line) {
        guard let actual = expression() else {
            recordFailure(withDescription: "Expected 'nil' to be true.", inFile: file, atLine: Int(line), expected: true)
            return
        }
        if actual != true {
            recordFailure(withDescription: "Expected this to be true.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect<T: Equatable>(_ this: @autoclosure () -> T?, equals expression: @autoclosure () -> T?, file: String = #file, line: UInt = #line) {
        let actual = this()
        let expected = expression()
        if !equals(actual, expected) {
            recordFailure(withDescription: "Expected '\(String(describing: actual))' to equal '\(String(describing: expected))]", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect<T: Equatable>(_ this: @autoclosure () -> T?, notEquals expression: @autoclosure () -> T?, file: String = #file, line: UInt = #line) {
        let actual = this()
        let expected = expression()
        if equals(actual, expected) {
            recordFailure(withDescription: "Expected '\(String(describing: actual))' to not equal '\(String(describing: expected))]", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(date thisDate: Date?, equals thatDate: Date?, downToThe component: Calendar.Component = .second, file: String = #file, line: UInt = #line) {
        guard let thisDate = thisDate, let thatDate = thatDate else {
            recordFailure(withDescription: "Expected dates to not be nil", inFile: file, atLine: Int(line), expected: true)
            return
        }
        if !Calendar.current.isDate(thisDate, equalTo: thatDate, toGranularity: component) {
            recordFailure(withDescription: "Expected \(thisDate) to equal: \(thatDate)", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    
    // MARK: - Contains
    func expect(_ actual: String, contains expected: String..., file: String = #file, line: UInt = #line) {
        let result = expected.map { actual.contains($0) }
        if let index = result.index(of: false) {
            recordFailure(withDescription: "Expected \(actual) to contain \(expected[index])", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(_ actual: String, doesNotContain expected: String..., file: String = #file, line: UInt = #line) {
        let result = expected.map { actual.contains($0) }
        if let index = result.index(of: true) {
            recordFailure(withDescription: "Expected \(actual) to not contain \(expected[index])", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    // MARK: - Private Methods
    private func equals<T: Equatable>(_ lhs: T?, _ rhs: T?) -> Bool {
        if lhs == nil && rhs == nil {
            return true
        }
        guard let actual = lhs, let expected = rhs else {
            return false
        }
        return actual == expected
    }
}
