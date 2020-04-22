//
//  XCUIElement+Extension.swift
//  Message Board
//
//  Created by Benjamin Hakes on 2/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    func labelContains(text: String) -> Bool {
        let predicate = NSPredicate(format: "label CONTAINS %@", text)
        return staticTexts.matching(predicate).firstMatch.exists
    }
}
