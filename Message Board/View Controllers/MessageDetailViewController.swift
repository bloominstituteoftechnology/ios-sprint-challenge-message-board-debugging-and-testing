//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
    
    // MARK:- View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    // MARK:- Update views
    
    private func updateViews() {
        
        guard let message = message else {
            actionButton.title = "Send"
            return
        }
        
        title = message.messageText
        actionButton.title = "Update"
        
        messageTextView.text = message.messageText
        senderNameTextField.text = message.sender
    }
    

    // MARK:- Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThread = messageThread else { return }
        
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, orUpdateWithMessage: message, completion: {
            DispatchQueue.main.async {
                // Pop the view controller off of the navigation stack
                self.navigationController?.popViewController(animated: true)
            }
        })
    }

    
    // MARK:- Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?
    var message: MessageThread.Message?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var actionButton: UIBarButtonItem!
}
