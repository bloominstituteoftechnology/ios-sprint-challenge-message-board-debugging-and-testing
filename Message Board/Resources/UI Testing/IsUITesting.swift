//
//  IsUITesting.swift
//  Message Board
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

public var unitTesting: Bool = false

var isUITesting: Bool {
    return CommandLine.arguments.contains("UITesting") || unitTesting
}
