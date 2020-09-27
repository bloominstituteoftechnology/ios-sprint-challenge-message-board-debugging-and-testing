# Bugs
## Bug: Threads do not appear to be created after typing a name and pressing return, because they don't appear in the table or in the database.
### Partial fix: Resume the data task in createMessageThread function.

## Bug: Newly created threads do not appear in the table until the table is acted on (e.g. scrolling).
### Fix: Move tableView.reloadData to background queue.

## Bug: Title of thread does not show in thread detail view. Instead, it is just "Title".
### Fix: Fixed a typo in the prepare for segue "ViewMessageDetail".

## Bug: App fails to retrieve threads from database.
### Fix: Updated fetchMessageThreads in the MessageThreadController to decode an array instead of a dictionary.

## Bug: Unable to create new message. Pressing Send appears to do nothing inside both the app and the database.
### Fix: Fixed prepare for segue to correctly go from MessageThreadDetailTableViewController to the UINavigationController and then MessageDetailViewController. Messages no appear in database when Send is pressed, but the message detail screen stays in view.
### Fix: Added a dismiss statement to the end of the Send action method, and added one to Cancel as well. Messages still don't appear in the MessageThreadDetailTableView.
### Fix: Created a delegate on MessageDetailView to inform the tableview that changes have been made, then I set the tableview to the delegate so it could receive the message and reload the data.