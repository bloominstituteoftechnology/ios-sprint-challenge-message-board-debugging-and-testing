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

    // MARK: - Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text else {
            print("No senderName")
            return }
        guard let messageText = messageTextView.text else {
            print("No messageText")
            return }
        guard let messageThread = messageThread else {
            print("No messageThread")
            return
        }
        
        guard let messageThreadController = messageThreadController else {
            print("No messageThreadController")
            return
        }
        
        messageThreadController.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
            DispatchQueue.main.async {
                self.dismiss(animated: true)
                    
            }
            
        })
    }
}
