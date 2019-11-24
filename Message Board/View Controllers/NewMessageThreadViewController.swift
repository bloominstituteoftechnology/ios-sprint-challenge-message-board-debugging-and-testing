//
//  NewMessageThreadViewController.swift
//  Message Board
//
//  Created by Dillon P on 11/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol NewThreadDelegate {
    func newThreadSaved()
}

class NewMessageThreadViewController: UIViewController {
    
    var delegate: NewThreadDelegate?
    var messageThreadController: MessageThreadController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var threadTitleTextField: UITextField!
    

    @IBAction func saveNewThreadTapped(_ sender: Any) {
        guard let threadTitle = threadTitleTextField.text, !threadTitle.isEmpty, let messageThreadController = messageThreadController else { return }
        
        messageThreadController.createMessageThread(with: threadTitle) {
            
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Message Thread Created", message: "You have created a new thread. You can post a new message from the thread detail page.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                    self.navigationController?.popViewController(animated: true)
                    self.delegate?.newThreadSaved()
                }))
                self.present(alert, animated: true)
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
