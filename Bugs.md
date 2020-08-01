## Bug #1:
Adding new threads does not send any data to firebase. Ensured firebase permissions allow for unauthenticated PUT requests.
> Solution: Added .resume() to dataTask in createMessageThread func

## Bug #2:
Error after submitting new thread: UI API called on a background thread. "Main Thread Checker: UI API called on a background thread: -[UITableViewController tableView]"
> Solution: Wrapped self.tableView.reloadData()

## Bug #3:
Entries stored in firebase are not being synced after fetchMessageThreads is being called. JSON is returned as a dictionary, but app is expecting an array.
> Solution: Added .resume() to dataTask for fetchMessageThreads func. Also added .map() { $0.value } to end of decoding line.

## Bug #4:
Send/Cancel do not work when entering a thread.
>Solution: Added dismiss(animated: true, completion: nil) to cancelTapped. Fixed typo in segue.identifier. Fixed second typo. Changed prepareForSegue to allow for secondary nav controller.


