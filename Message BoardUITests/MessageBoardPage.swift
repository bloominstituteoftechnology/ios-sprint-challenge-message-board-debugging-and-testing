//
//  MessageBoardPage.swift
//  Message BoardUITests
//
//  Created by De MicheliStefano on 14.09.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct MessageBoardPage: TestPage {
    let testCase: XCTestCase
    
    // MARK: - Elements
    var tableview: XCUIElement {
        return app.tables.element
    }
    
    func tableViewCell(for index: Int) -> XCUIElement {
        return tableview.cells.element(boundBy: index)
    }
    
    var tableViewCells: XCUIElementQuery {
        return tableview.cells
    }
    
    var navigationElement: XCUIElement {
        return app.navigationBars.element(boundBy: 0)
    }
    
    var navigationTitle: String {
        return navigationElement.staticTexts.element.label
    }
    
    var navigationBarButton: XCUIElement {
        return navigationElement.buttons.element(boundBy: 1)
    }
    
    var nameTextField: XCUIElement {
        return app.textFields.element(boundBy: 0)
    }
    
    var messageTextField: XCUIElement {
        return app.textViews.element(boundBy: 0)
    }
    
    // MARK: - Actions (interactions)
    
    @discardableResult func tapOnCell(for index: Int, file: String = #file, line: UInt = #line) -> MessageBoardPage {
        let cell = tableViewCell(for: index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return self
    }
    
    @discardableResult func tapOnBarButton(file: String = #file, line: UInt = #line) -> MessageBoardPage {
        let barButton = navigationBarButton
        testCase.expect(exists: barButton, file: file, line: line)
        barButton.tap()
        return self
    }
    
    @discardableResult func typeName(with name: String, file: String = #file, line: UInt = #line) -> MessageBoardPage {
        nameTextField.tap()
        nameTextField.typeText(name)
        return self
    }
    
    @discardableResult func typeMessage(with message: String, file: String = #file, line: UInt = #line) -> MessageBoardPage {
        messageTextField.tap()
        messageTextField.typeText(message)
        return self
    }
    
    // MARK: - Verifications
    
    @discardableResult func verifySegueToThread(for index: Int, file: String = #file, line: UInt = #line) -> MessageBoardPage {
        let thread = tableViewCell(for: index)
        testCase.expect(exists: thread, file: file, line: line)
        let threadTitle = thread.staticTexts.element(boundBy: 0).label
        tapOnCell(for: index)
        testCase.expect(threadTitle, equals: navigationTitle, file: file, line: line)
        return self
    }
    
    @discardableResult func verifyMessageExists(for index: Int, file: String = #file, line: UInt = #line) -> MessageBoardPage {
        let thread = tableViewCell(for: index)
        testCase.expect(exists: thread, file: file, line: line)
        thread.tap()
        let firstMessage = tableViewCell(for: 0)
        testCase.expect(exists: firstMessage)
        return self
    }
    
    @discardableResult func verifyHasAddedNewMessage(for thread: Int, name: String, message: String, file: String = #file, line: UInt = #line) -> MessageBoardPage {
        let cell = tableViewCell(for: thread)
        testCase.expect(exists: cell)
        tapOnCell(for: thread)
        navigationBarButton.tap()
        typeName(with: name)
        typeMessage(with: message)
        navigationBarButton.tap()
        let newCell = tableViewCell(for: 1)
        testCase.expect(exists: newCell)
        let newMessage = newCell.staticTexts.element(boundBy: 0).label
        testCase.expect(newMessage, equals: message)
        return self
    }

}
