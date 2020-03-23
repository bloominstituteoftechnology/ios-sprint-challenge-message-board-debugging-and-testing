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
        
        guard let senderName = senderNameTextField.text,
            let messageText = messageTextView.text,
            let messageThreadController = messageThreadController,
            let messageThread = messageThread else { return }
        
        messageThreadController.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
            print("Message created!")
            
            DispatchQueue.main.async {
                 self.navigationController?.popViewController(animated: true)
            }
        })
    }

    // MARK: - Properties
    
    var messageThreadController: MessageThreadController?
    var messageThread: MessageThread?
//    {
//        didSet{
//            updateViews()
//        }
//    }
//    var message: MessageThread.Message?

    @IBOutlet weak var senderNameTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
//    func updateViews(){
//        guard let message = message else {
//
//            return
//        }
//    }
}
