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
    var messageThreadDetailTVC: MessageThreadDetailTableViewController?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    // MARK: - View Lifecycle

    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThread = messageThread,
            let messageThreadDetailTVC = messageThreadDetailTVC
            else { return }
        
        messageThreadController?.createMessage(
            in: messageThread,
            withText: messageText,
            sender: senderName)
        {
            print("Message created!")
            DispatchQueue.main.async {
                self.navigationController?.popToViewController(
                    messageThreadDetailTVC,
                    animated: true)
            }
        }
    }
}
