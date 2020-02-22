//
//  UserDefaultsWrapper.swift
//  Message Board
//
//  Created by Kenny on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//
//CREDIT: https://www.avanderlee.com/swift/property-wrappers/

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultsConfig {
    @UserDefault("username", defaultValue: "")
    static var username: String
}
