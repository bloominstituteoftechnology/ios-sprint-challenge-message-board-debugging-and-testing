//
//  MessageThreadsTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadsTableViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.accessibilityIdentifier = "MessageThreadsTableViewController.tableView"
	}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        messageThreadController.fetchMessageThreads {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func createThread(_ sender: Any) {
        threadTitleTextField.resignFirstResponder()

        guard let threadTitle = threadTitleTextField.text else { return }
        
        threadTitleTextField.text = ""
        
        messageThreadController.createMessageThread(with: threadTitle) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThreadController.messageThreads.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageThreadCell", for: indexPath)
        
        cell.textLabel?.text = messageThreadController.messageThreads[indexPath.row].title

        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		messageThreadController.currentThread = messageThreadController.messageThreads[indexPath.row]
	}
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MessageThreadDetailTableViewController {
            
            destinationVC.messageThreadController = messageThreadController
        }
    }
    
    // MARK: - Properties
    
	var messageThreadController: MessageThreadController!
    
    @IBOutlet weak var threadTitleTextField: UITextField!
}
