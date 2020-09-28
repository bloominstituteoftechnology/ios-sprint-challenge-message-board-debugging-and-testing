#  BUGS

1. missing .resume( ) at end of `URLSession.shared.dataTask`
    a. added .resume( ) on line after closure on line 71 of MessageThread Controller
    b. Created test and verified failed and passed after implimenting fix.

2. unable to create messages, spelling error on segue identifier in line 50 of MessageThreadDetailTableViewController
    a. corrected spelling error
    b. created test successfully

3.  self.tableView.reloadData( ) on MessageThreadDetailTableViewController line 38 not running on main thread.
    a. solution is to implement DispatchQueue.main.async on self.tableView.reloadData()
  
4. 
