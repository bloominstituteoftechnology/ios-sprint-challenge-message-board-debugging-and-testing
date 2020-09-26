#  BuggsCollection

# Find Bugs
- 1. unable to create a new thread- error in messageThreadsTVC- func CreateThread() -UITableViewController.tableView must be used from main thread only + UITableView.reloadData() must be used from main thread only 
- 2. unable to SEND new message 
 - 3. firebase: sending message to firebase is working, fetching message is broken
-




# Fixed Bugs
- 1. unable to create a new thread- fix-perform reloadData in a async block
- 2. 

