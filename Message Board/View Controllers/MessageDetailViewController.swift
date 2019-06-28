//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {

    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text, !senderName.isEmpty,
            let messageText = messageTextView.text, !messageText.isEmpty else { return }
            // Message is coming up nil.
        if let messageThread = messageThread {
            messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
                print("Message created!")
            })
        }
    }

    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
}
