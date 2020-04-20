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

    // MARK: - Outlets
    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!

    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        // guarding for empty sender and message
        guard let senderName = senderNameTextField.text, !senderName.isEmpty,
            let messageText = messageTextView.text, !messageText.isEmpty,
            let messageThread = messageThread else { return }
        
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
            
            // Pop view controller
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
}
