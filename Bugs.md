# Bugs

## Found and Fixed

- Bug: Message threads do not appear in table or in firebase after pressing return.
    - Fix: Resume the data task in the createMessageThread function. Remaining bug: Threads still do not appear in table unless tableview is tapped
- Bug: Message threads do not appear in table after creation until tableview is tapped.
	- Fix: Put the self.tableView.reloadData() contained within the completion of createMessageThread inside a DispatchQueue.main.async.
- Bug: Title of thread does not show in the title label of thread detail; instead it just says "Title"
	- Fix: No data was being passed through the segue because the segue identifier was mistyped, so I fixed it. I also found a similar mistype in the message thread table view controller, so I fixed that one also. Most likely a similar bug was avoided.
- Bug: In New Message, pressing the Send button seems to do nothing.
	- Fix: Change the segue.destination to UINavigationController and from there set the destinationVC as MessageDetailViewController.
	- Fix: Add functionality to dismiss view controller when Send is finished doing it's work.
- Bug: In New Message, pressing the Cancel button seems to do nothing.
	- Fix: Add functionality to dismiss view controller when Cancel is tapped.
- Bug: After creating a message, while the message does get added to firebase, it does not appear in the thread detail tableView.
	- Fix: Created a delegate on the MessageDetail to inform the tableView that changes have been made so it should reload the tableview and then set the tableview as the delegate so it could receive the message.

## Found and Not Fixed

- Bug: There's an error trying to decode the message threads fetched from firebase.
