#  Bugs
Issue: Create thread textfield does not create a new thread.
Fix: missing call to resume() applied to createMessageThread()

Issue: UI API called on a background thread: -[UITableViewController tableView]
Fix: Moved tableView.reloadData to main thread

Issue: Identifier not found in prepare(for segue:) inside MessageThreadDetailTableViewController
Fix: Fixed typo in "AddMessage" segue identifier

Issue: Existing threads are not being fetched on app launch
Fix: missing call to resume() applied to fetchMessageThreads()

Issue: Expected to decode Array<Any> but found a dictionary instead
Fix: Change JsonDecoder to output a dictionary and map the resulting data into the correct format

Issue: MessageThread object not being passed from vc to vc
Fix:   - Fixed typo in ViewMessageThread segue identifier
         - Removed extra navigation controller to allow object to be passed from vc to vc
