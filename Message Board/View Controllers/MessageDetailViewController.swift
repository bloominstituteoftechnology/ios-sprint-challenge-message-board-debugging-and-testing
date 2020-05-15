//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        senderNameTextField.text = UserDefaults.standard.string(forKey: "senderName") ?? ""
    }
    
    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThread = messageThread else { return }
        
        // save senderName to UserDefaults
        UserDefaults.standard.set(senderName, forKey: "senderName")
        
        messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
        })
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
}
