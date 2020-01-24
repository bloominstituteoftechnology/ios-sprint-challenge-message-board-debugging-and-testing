//
//  MessageThreadsTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadsTableViewController: UITableViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var threadTitleTextField: UITextField!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    let messageThreadController = MessageThreadController()
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        messageThreadController.fetchMessageThreads {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func createThread(_ sender: Any) {
        threadTitleTextField.resignFirstResponder()
        
        guard let threadTitle = threadTitleTextField.text, !threadTitle.isEmpty else { return }
        
        messageThreadController.createMessageThread(with: threadTitle) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        threadTitleTextField.text = ""
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  Segues.viewMessageThread {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? MessageThreadDetailTableViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThreadController.messageThreads[indexPath.row]
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Table View DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThreadController.messageThreads.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.messageThreadCell, for: indexPath)
        
        cell.textLabel?.text = messageThreadController.messageThreads[indexPath.row].title
        
        return cell
    }
}
