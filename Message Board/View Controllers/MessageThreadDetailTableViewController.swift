//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.accessibilityIdentifier = "MessageThreadDetailTableViewController.tableView"
        title = messageThread?.title
		tableView.tableFooterView = UIView()
		tableView.separatorStyle = .none
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
		let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
		let longPressRecognizer = UILongPressGestureRecognizer()
		longPressRecognizer.minimumPressDuration = 0.5
		longPressRecognizer.addTarget(self, action: #selector(longPress))
		cell.addGestureRecognizer(longPressRecognizer)
		let message = messageThread?.messages.sorted(by: { $0.timestamp > $1.timestamp }) [indexPath.row]
		guard let sender = message?.sender else { return UITableViewCell() }
		cell.textLabel?.text = message?.text
		cell.detailTextLabel?.text =  sender
		cell.detailTextLabel?.textColor = textColors.randomElement() 
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMessage" {
            guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThread
        }
    }
    
    // MARK: - Properties

    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
	var textColors: [UIColor] = [.systemBlue, .systemTeal, .systemPink, .systemGreen, .systemOrange, .systemPurple, .systemYellow]

	var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .long
		formatter.timeStyle = .short
		return formatter
	}()

	@objc func longPress() {
		let indexPath = tableView.indexPathForSelectedRow
		let message = messageThread?.messages[indexPath?.row ?? 0]
		guard let date = message?.timestamp else { return }
		let alert = UIAlertController(title: "Message sent on: \(dateFormatter.string(from: date))", message: nil, preferredStyle: .actionSheet)
		alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}
}
