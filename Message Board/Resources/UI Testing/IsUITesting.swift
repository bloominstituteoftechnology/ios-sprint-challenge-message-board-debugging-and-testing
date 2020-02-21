//
//  IsUITesting.swift
//  Message Board
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

var isUITesting: Bool {
    return CommandLine.arguments.contains("UITesting")
}
