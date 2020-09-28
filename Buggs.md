#  BuggsCollection

# Found Bugs
1. unable to create a new thread- error in messageThreadsTVC- func CreateThread() -UITableViewController.tableView must be used from main thread only + UITableView.reloadData() must be used from main thread only 

2. unable to SEND new message
    tap CANCEL not working
    
3. firebase: sending message to firebase is working, fetching message not decoding properly
         func fetchMessageThreads() returning 0 values

 4.  created threads dont persist. or fetch on launch 
 
 5. message board title doesnt update




# Fixed Bugs
1. unable to create a new thread- fixed-perform reloadData in a async block + .resume calls

2.

3.
