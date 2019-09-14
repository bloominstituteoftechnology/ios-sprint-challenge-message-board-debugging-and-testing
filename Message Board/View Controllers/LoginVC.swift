//
//  LoginVC.swift
//  Message Board
//
//  Created by Jeffrey Santana on 9/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

	//MARK: - IBOutlets
	
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var loginBtn: UIButton!
	
	//MARK: - Properties
	
	let messageThreadController = MessageThreadController()
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		usernameTextField.becomeFirstResponder()
		usernameTextField.text = UserSettings.shared.username
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let threadsVC = segue.destination.childViewControllers.first as? MessageThreadsTableViewController {
			threadsVC.messageThreadController = messageThreadController
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		view.endEditing(true)
	}
	
	//MARK: - IBActions
	
	@IBAction func loginBtnTapped(_ sender: Any) {
		guard let username = usernameTextField.optionalText, username.count > 2 else { return }
		
		UserSettings.shared.username = username
		
		performSegue(withIdentifier: "MessageThreadsTableViewControllerSegue", sender: nil)
	}
	
	//MARK: - Helpers
	
	
}
