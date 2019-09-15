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
		tableView.tableFooterView = UIView()
		tableView.accessibilityIdentifier = "MessageThreadTableViewController.tableView"
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
		print(messageThreadController.messageThreads.count)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let sortedArray = messageThreadController.messageThreads.sorted(by: { $0.dateCreated > $1.dateCreated })
		return sortedArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageThreadCell", for: indexPath)
		let sortedArray = messageThreadController.messageThreads.sorted(by: { $0.dateCreated > $1.dateCreated })
		let messageThread = sortedArray[indexPath.row]
//		let messageThread = messageThreadController.messageThreads[indexPath.row]

		cell.textLabel?.text = messageThread.title
		cell.detailTextLabel?.text = dateFormatter.string(from: messageThread.dateCreated)

        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewMessageThread" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? MessageThreadDetailTableViewController else { return }
			let sortedArray = messageThreadController.messageThreads.sorted(by: { $0.dateCreated > $1.dateCreated })
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = sortedArray[indexPath.row]
        }
    }
    
    // MARK: - Properties

	var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		return formatter
	}()
    
    let messageThreadController = MessageThreadController()

    
    @IBOutlet weak var threadTitleTextField: UITextField!
}
