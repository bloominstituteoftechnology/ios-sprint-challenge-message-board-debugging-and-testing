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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.rightBarButtonItem?.accessibilityIdentifier = "Detail Right Bar Button Item"
  }
  
  
  @IBAction func sendMessage(_ sender: UIBarButtonItem) {
    print("He")
    guard let senderName = senderNameTextField.text,
      let messageText = messageTextView.text,
      let messageThread = messageThread else { return }
    
    messageThreadController?.createMessage(in: messageThread, withText: messageText, sender: senderName, completion: {
      print("Message created!")
    })
    navigationController?.popViewController(animated: true)
  }
  
  // MARK: - Properties
  
  var messageThreadController: MessageThreadController?
  var messageThread: MessageThread?
  
  @IBOutlet weak var senderNameTextField: UITextField! {
    didSet {
      senderNameTextField.accessibilityIdentifier = "NameTextField"
      senderNameTextField.becomeFirstResponder()
    }
  }
  @IBOutlet weak var messageTextView: UITextView! {
    didSet {
      messageTextView.accessibilityIdentifier = "MessageTextView"
    }
  }
}
