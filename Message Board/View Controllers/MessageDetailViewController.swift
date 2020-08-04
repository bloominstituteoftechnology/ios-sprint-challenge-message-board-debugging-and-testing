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

    @IBOutlet weak var stackView: UIStackView!

    func viewdidLoad() {
        super.viewDidLoad()
        stackView.isAccessibilityElement = false
        messageTextView.isAccessibilityElement = true
        messageTextView.accessibilityIdentifier = "newMessageText"
        
    }
    // MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
          dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessage(_ sender: UIBarButtonItem) {
            guard let senderName = senderNameTextField.text,
                let messageText = messageTextView.text,
                let messageThread = messageThread else { return }

           messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
               print("Message Created")

            })
            navigationController?.dismiss(animated: true, completion: nil)
        }
    }
