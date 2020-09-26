//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextView.accessibilityIdentifier = "MessageDetailViewController.MessageTextView"
    }

    // MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        var messageText = "..."
        guard let senderName = senderNameTextField.text,
            let messageThread = messageThread else { return }
        if let message = messageTextView.text {
            messageText = message
        }
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
