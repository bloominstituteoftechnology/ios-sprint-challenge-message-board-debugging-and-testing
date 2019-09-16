//
//  UserSettings.swift
//  Message Board
//
//  Created by Jeffrey Santana on 9/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class UserSettings {
	static let shared = UserSettings()
	
	private let defaults = UserDefaults.standard
	private let usernameKey = "username_key"
	
	var username: String? {
		get {
			guard let username = defaults.value(forKey: usernameKey) as? String else { return "TestUser" }
			return username
		}
		set {
			if newValue != nil {
				defaults.set(newValue, forKey: usernameKey)
			}
		}
	}
}
