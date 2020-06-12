//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var messageThread: MessageThread? {
        didSet {
            tableView.reloadData()
        }
    }
    var messageThreadController: MessageThreadController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    func updateViews() {
        guard let messageThread = messageThread else { return }
        
        title = messageThread.title
    }
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThread?.messages.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        let message = messageThread?.messages[indexPath.row]
        
            cell.textLabel?.text = message?.text
            cell.detailTextLabel?.text = message?.sender

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddAMessage" {
            
            
            if let navigationController = segue.destination as? UINavigationController,
                let createMessageVC = navigationController.viewControllers.first as? MessageDetailViewController {
                createMessageVC.messageThread = messageThread
                createMessageVC.messageThreadController = messageThreadController
            }
            
//            if let navC = segue.destination as? UINavigationController,
//                let destinationVC = navC.viewControllers.first as? MessageDetailViewController {
//                destinationVC.messageThread = messageThread
//                destinationVC.messageThreadController = messageThreadController
//            }
        }
    }
}
