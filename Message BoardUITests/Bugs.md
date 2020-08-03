#  Bugs

 Bugs found

 #1 Cannot create a new thread 
 #2 Can create thread with error now, but in detail view Send does not perform any  all
 #3 Cancel does not do anything in detail view
 #4 Once thread fixed  new error - UITableViewController.tableView must be used from main thread only
 #5 Error decoding message threads from JSON data: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))










 Fixes 
 #1 added .resume() to create thread in message controller. Network fetch not working?
 #2 Added .resume() to fetch thread in message controller  -  made new error / warning see #4 above 
 #3 Added dispatchQuese.main statement to the createThread IBAction


