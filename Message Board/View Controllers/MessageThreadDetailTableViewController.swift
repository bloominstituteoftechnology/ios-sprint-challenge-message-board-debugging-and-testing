//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController {

    private enum Identifier : String {
        case cell = "MessageCell"
        case addSegue = "AddMessage"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = messageThread?.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThread?.messages.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cell.rawValue, for: indexPath)

        let message = messageThread?.messages[indexPath.row]
        
        cell.textLabel?.text = message?.messageText
        cell.detailTextLabel?.text = message?.sender
        
        return cell
    }

    // MARK: - Navigation
    
   //MARK:- Typo Add Message: -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifier.addSegue.rawValue {
            guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThread
        }
    }
    
    // MARK: - Properties

    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
}
