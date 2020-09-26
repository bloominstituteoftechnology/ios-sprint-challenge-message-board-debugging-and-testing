//
//  Message_BoardUITests2.swift
//  Message BoardUITests2
//
//  Created by Norlan Tibanear on 9/26/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests2: XCTestCase {

   

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
                
                
                                
            }
        }
    }
}
