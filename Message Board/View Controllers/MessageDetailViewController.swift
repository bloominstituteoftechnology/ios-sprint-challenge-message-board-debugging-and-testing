//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		senderNameTextField.isEnabled = false
		senderNameTextField.text = UserSettings.shared.username
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		view.endEditing(true)
	}

    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThread = messageThreadController.currentThread else { return }
        
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
			
			DispatchQueue.main.async {
				self.navigationController?.popViewController(animated: true)
			}
        })
    }

    // MARK: - Properties
	
	let textViewPlaceholder = "Enter message"
    var messageThreadController: MessageThreadController!

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
}

extension MessageDetailViewController: UITextViewDelegate {
	private func setupTextView() {
		messageTextView.delegate = self
		messageTextView.text = textViewPlaceholder
		messageTextView.textColor = UIColor.lightGray
	}
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor == UIColor.lightGray {
			textView.text = nil
			textView.textColor = UIColor.black
		}
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text.isEmpty {
			textView.text = textViewPlaceholder
			textView.textColor = UIColor.lightGray
		}
	}
}
