//
//  MessageDetailViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if messageThread != nil { print("MessageThread is not nil") }
        else { print("MessageThread is nil") }
    }

    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let senderName = senderNameTextField.text else {
            let alert = UIAlertController(title: "Unable to Create Message", message: "Your name is required!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let messageText = messageTextView.text else {
            let alert = UIAlertController(title: "Unable to Create Message", message: "A message is required!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let messageThread = messageThread else {
            let alert = UIAlertController(title: "Unable to Create Message", message: "An error occurred while trying to create your message. Please refresh app.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let messageThreadController = messageThreadController else {
            
            let alert = UIAlertController(title: "Unable to Create Message", message: "An error occurred while trying to create your message. Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        messageThreadController.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            DispatchQueue.main.async {
                print("Message created!")
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
