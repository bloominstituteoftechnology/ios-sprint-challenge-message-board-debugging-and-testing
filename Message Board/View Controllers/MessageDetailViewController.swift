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
    private var username = String()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        if UserDefaultsConfig.username != username {
            username = UserDefaultsConfig.username
            senderNameTextField.text = username
        }
    }
    
    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThread = messageThread else { return }
        UserDefaultsConfig.username = senderName
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        })
    }

    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
}
