//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol MessageDetailViewControllerDelegate: AnyObject {
	func didFinishSendingMessage()
}

class MessageDetailViewController: UIViewController, UITextFieldDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		senderNameTextField.delegate = self
		senderNameTextField.becomeFirstResponder()
		messageTextView.layer.cornerRadius = 4
	}
	

    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: UIButton) {

        guard let senderName = senderNameTextField.text,
			!senderName.isEmpty,
            let messageText = messageTextView.text,
			!messageText.isEmpty,
            let messageThread = messageThread else { return }

        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
			DispatchQueue.main.async {
				self.delegate?.didFinishSendingMessage()
				self.dismiss(animated: true, completion: nil)
			}
            print("Message created!")
        })
    }

	@IBAction func cancelTapped(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}

    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?
	var delegate: MessageDetailViewControllerDelegate?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
	@IBAction func sendButton(_ sender: UIButton) {
	}
}
