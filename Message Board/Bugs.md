//BUGS.md

/// BUG: Table view does not update when adding a new thread nor does the array update with the new value,
/// Fixed by putting the data task inside of a do block and resume the task at the end of the do block and placing the tableView.ReloadData() on the main thread.

///BUG: Detail view does not update with thread title as the view controller's title


///BUG: Table view controller does not pull down data from firebase and update the tableview.
/// Fixed by making the required coding keys and changing the decoding strategy from an array to a dictionary.


///BUG: Detail View button was unable to be cancelled and modal view was not dissmissing.
///Fixed by added a self.dissmiss method to the IBAction

///BUG: View Controller does not dissmiss after clicking save on the send message modal view controller

///BUG: Unable to create a new message to send to the thread.
/// Fixed weird X-code error where I was unable to use the segue identifier provided in the starter project. So I had to completely refactor the code for all dependency injections.
