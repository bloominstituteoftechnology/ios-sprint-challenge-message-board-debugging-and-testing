//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController, MessageDelegate {
    
    // MARK: - Properties

    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?

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
        print(messageThread?.messages.count ?? 0)
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
        // Bug: Same typo here; changed "AddMesage" to "AddMessage"
        if segue.identifier == "AddMessage" {
            // Bug: Code never gets past this guard statement, which is weird cuz it looks totally legit.
            // Ok, now after looking at the storyboard I see the problem. The segue destination appears to be
            // the MessageDetailViewController when running the app, but it's actually a UINavigationController,
            // so I fixed that so the correct data could be sent and the Send button would work just fine.
            guard let navController = segue.destination as? UINavigationController,
                let destinationVC = navController.viewControllers.first as? MessageDetailViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThread
            destinationVC.delegate = self
        }
    }
    
    func didAddMessage() {
        self.tableView.reloadData()
    }
}
